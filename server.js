var ejs = require('ejs');
var express = require('express');
var database = require('./modules/database');
var test = require('./modules/test');

var app = express();

var templateMain = null;
var fs = require('fs');
var templateMain = fs.readFileSync('main.ejs', 'utf-8');

app.use(express.static(__dirname + '/public'));

app.get('/', function(req, res) {


    var answer = database.answer
    console.log(answer);

    var connect = test.connectUser("aldarick@orange.fr", "aldarick");

    res.writeHead(200, {"Content-Type": "text/plain"});
    res.end("Hello World\n");


});

app.get('/main', function(req, res) {


    var answer = database.answer
    console.log(answer);

    var connect = test.connectUser("aldarick@orange.fr", "aldarick");

    res.end(ejs.render(templateMain));


});

app.listen(8080);
