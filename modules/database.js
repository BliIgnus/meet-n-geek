var mysql = require('mysql');

function closeConnection(connection) {
    connection.end();
}


function getConnection() {

    var connection = mysql.createConnection({
        host: 'localhost',
        user: 'meetngeek',
        password: 'meetngeek',
        database: 'meetngeek'
    });


    connection.connect(function (err) {
        if (!err) {
            //console.log("Database is connected ... nn");
        } else {
            console.log("Error connecting database ... nn");
        }
    });


    return connection;
}


// Returns true if the login credentials were correct, false otherwise
function checkLoginCredentials(mail, password) {

    var connection = getConnection();

    var query = "SELECT id from users " +
        "WHERE users.email = \"" + mail + "\" " +
        "AND users.password = \"" + password  + "\" "

    console.log(query);
    
    return connection.query(query, function (error, results, fields) {
        if (error) throw error;
        
        //console.log(results);
        console.log(results[0]);
        //return results;
    });
    
    closeConnection(connection);
}




module.exports.checkLoginCredentials = checkLoginCredentials;
