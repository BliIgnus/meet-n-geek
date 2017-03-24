var mysql      = require('mysql');

function getConnection(){
    
    var connection = mysql.createConnection({
      host     : 'localhost',
      user     : 'meetngeek',
      password : 'meetngeek',
      database : 'meetngeek'
    });
    
    connection.connect();
    return connection;
}

function closeConnection(connection){
    connection.end();
}
