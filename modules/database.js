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


// Returns the id the login credentials were correct, 0 otherwise
function checkLoginCredentials(mail, password, callback) {
    var con = getConnection();

    var query = "SELECT id from users " +
        "WHERE users.email = \"" + mail + "\" " +
        "AND users.password = \"" + password + "\" "

    var result = -1;
    con.query(query, function (err, rows) {
        if (err) callback(err,null);

        console.log('Data received from Db:\n');
        console.log(rows);

        console.log('ID:\n');
        if (rows.length < 1) result = 0;
        else result = rows[0].id;
        
        callback(null,result);

    });
}


module.exports.checkLoginCredentials = checkLoginCredentials;
