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
    getAllByRestaurantId: function(restaurantId, callback) {
        var sql = "select * from foods where R_ID = ?";
        db.getResult(sql, [restaurantId], function(results) {
            callback(results);
        });
    },
    delete: function(foodId, callback) {
        var sql = "delete from foods where F_ID = ?";
        db.execute(sql, [foodId], function(status) {
            callback(status);
        });
    }
}