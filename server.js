var ejs = require('ejs');
var express = require('express');
var expressSession = require('express-session');
var database = require('./modules/database');
var userSession = require('./modules/userSession');
var bodyParser = require('body-parser');

var app = express();

var templateMain = null;
var fs = require('fs');
var templateMain = fs.readFileSync('main.ejs', 'utf-8');

app.use(express.static(__dirname + '/public'));
app.use(expressSession({
    secret: 'BIG_SECRET_SSH_KEY_OF_THE_DEAD_WHICH_WILL_AMAZE_YOU'
}));

app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(bodyParser.json());

app.listen(8080);


function connect(req, res, email, password) {


    database.checkLoginCredentials(email, password, function (err, id) {
        if (err) {
            // error handling code goes here
            console.log("ERROR : ", err);
        } else {
            // code to execute on data retrieval
            
            console.log("========= \n Got : " + id)
            
            // set session id if the login credientials are correct. Do nothing otherwise
            if (id){
                var session = userSession.getSession(req);
                userSession.setSessionId(session, id);
            }
            
            // redirect to the index
            res.writeHead(301, {
                Location: "http://localhost:8080/"
            });
            res.end();
        }
    });
}



app.get('/', function (req, res) {

    var connected = userSession.checkIfConnected(req);
    if (!connected) {
        res.writeHead(301, {
            Location: "http://localhost:8080/signin"
        });
        res.end();
    } else {
        res.writeHead(200, {
            "Content-Type": "text/plain"
        });
        res.end("Hello World\n");
    }



});

app.get('/main', function (req, res) {

    var main_data = JSON.parse(fs.readFileSync('main_data.json'));

    res.end(ejs.render(templateMain, main_data));

});

app.get('/signin', function (req, res) {

    var templateSignin = fs.readFileSync('sign_in.ejs', 'utf-8');
    res.end(ejs.render(templateSignin));

});

app.post('/connect', function (req, res) {

    var email = req.body.mail;
    var password = req.body.password;
    console.log("Connecting (" + email + ", " + password + ")");
    connect(req, res, email, password);

});
