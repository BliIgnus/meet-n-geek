var express = require('express');
var database = require('./modules/database');
var test = require('./modules/test');

var app = express();

app.get('/', function(req, res) {
    

    var answer = database.answer
    console.log(answer);
    
    var connect = test.connectUser("aldarick@orange.fr", "aldarick");
    
    res.writeHead(200, {"Content-Type": "text/plain"});
    res.end("Hello World\n");
    
    
});

app.listen(8080);