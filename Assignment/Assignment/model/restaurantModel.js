var db = require('./db');

module.exports = {
    get: function(restaurantId, callback) {
        var sql = "select * from restaurants where R_ID = ?";
        db.getResult(sql, [restaurantId], function(result) {
            callback(result);
        });
    },
    getAll: function(callback) {
        var sql = "select * from restaurants";
        db.getResult(sql, [], function(results) {
            callback(results);
        });
    },
    insert: function(restaurant, callback) {
        var sql = "insert into restaurants values (NULL, ?, ?, ?, ?, ?)";
        db.execute(sql, [restaurant.name, restaurant.description, restaurant.type, restaurant.location, restaurant.status], function(status) {
            callback(status);
        });
    },

}