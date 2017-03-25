var mysql = require('mysql');
const async = require('async')


function closeConnection(connection) {
    connection.end();
}


function getConnection(multipleStatementsAllowed) {

    var connection = mysql.createConnection({
        host: 'localhost',
        user: 'meetngeek',
        password: 'meetngeek',
        database: 'meetngeek',
        multipleStatements: multipleStatementsAllowed
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
    var con = getConnection(false);

    var query = "SELECT id from users " +
        "WHERE users.email = \"" + mail + "\" " +
        "AND users.password = \"" + password + "\" "

    var result = -1;
    con.query(query, function (err, rows) {
        if (err) callback(err, null);

        console.log('Data received from Db:\n');
        console.log(rows);

        console.log('ID:\n');
        if (rows.length < 1) result = 0;
        else result = rows[0].id;

        callback(null, result);

    });
}


function getUserInfos(id, callback) {
    var con = getConnection(false);

    var query = "SELECT * from users " +
        "WHERE id = " + id;

    con.query(query, function (err, rows) {
        if (err) callback(err, null);

        console.log('Data received from Db:\n');
        console.log(rows);

        callback(null, rows[0]);

    });
}


function getAllUserInfos(id, callback) {

    var connection = getConnection(true);

    //    var query = "SELECT * from users WHERE id = " + id;
    //    query += "; SELECT U.pseudo FROM users U, friends F WHERE F.friend_id = U.id AND F.user_id = " + id + " LIMIT 3";
    //    
    //    connection.query(query, function (err, rows) {
    //        if (err) callback(err,null);
    //
    //        console.log('Data received from Db:\n');
    //        console.log(rows);
    //        
    //        callback(null,rows[0]);
    //
    //    });

    async.parallel([
    function (callback) {
            var queryData = '' +
                "SELECT * from users WHERE id = " + id;;
            connection.query(queryData, function (err, rows1) {
                if (err) {
                    return callback(err);
                }
                return callback(null, rows1);
            });
    },
    function (callback) {
            var query = '' +
                "SELECT U.pseudo FROM users U, friends F WHERE F.friend_id = U.id AND F.user_id = " + id + " LIMIT 3";
            connection.query(query, function (err, rows2) {
                if (err) {
                    return callback(err);
                }
                return callback(null, rows2);
            });
    }
    ], function (error, callbackResults) {
        if (error) {
            //handle error
            console.log(error);
        } else {
//            console.log("========= \n Multiple query ...")
//            console.log(callbackResults[0]); // rows1
//            console.log(callbackResults[1]); // rows2
            // use this data to send back to client etc.
            
            callback(null, callbackResults)
        }
    });


}

module.exports.getAllUserInfos = getAllUserInfos;
module.exports.getUserInfos = getUserInfos;
module.exports.checkLoginCredentials = checkLoginCredentials;
