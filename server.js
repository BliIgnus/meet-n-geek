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


app.get('/', function (req, res) {

    var connected = userSession.checkIfConnected(req);
    if (connected) {
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

app.get('/main', function(req, res) {

    var main_data = JSON.parse(fs.readFileSync('main_data.json'));



    //var answer = database.answer
    //console.log(answer);

    var connect = test.connectUser("aldarick@orange.fr", "aldarick");

    //var html = new EJS({url: 'main.ejs'}).render(main_data);
    res.end(ejs.render(templateMain, main_data));


});

app.get('/signin', function (req, res) {

    var templateSignin = fs.readFileSync('sign_in.ejs', 'utf-8');
    res.end(ejs.render(templateSignin));

});

app.post('/connect', function (req, res) {

    var email = req.body.mail;

    var password = req.body.password;
    var correct = database.checkLoginCredentials(email, password);

    if (correct) {
        console.log("Connecting...")
        connect(req, email, password);
    } else {
        res.writeHead(301, {
            Location: "http://localhost:8080/signin"
        });
    }


});