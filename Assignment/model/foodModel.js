var db = require('./db');

module.exports = {
    get: function(foodId, callback) {
        var sql = "select * from foods where F_ID = ?";
        db.getResult(sql, [foodId], function(result) {
            callback(result);
        });
    },
    getAll: function(callback) {
        var sql = "select * from foods";
        db.getResult(sql, [], function(results) {
            callback(results);
        });
    },
    insert: function(food, callback) {
        var sql = "insert into foods values (NULL, ?, ?, ?, ?)";
        db.execute(sql, [food.title, food.description, food.restaurantId, food.image], function(status) {
            callback(status);
        });
    },
}