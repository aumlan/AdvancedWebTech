var db = require('./db');

module.exports = {
    get: function(foodReviewId, callback) {
        var sql = "select * from food_review where = FR_ID = ?";

        db.getResult(sql, [foodReviewId], function(result) {
            callback(result);
        });
    },
    getByFoodId: function(foodId, callback) {
        var sql = "select * from food_review where F_ID = ?";

        db.getResult(sql, [foodId], function(result) {
            callback(result);
        });
    },
    getAll: function(callback) {
        var sql = "select * from food_review";
        db.getResult(sql, [], function(results) {
            callback(results);
        });
    },
    insert: function(review, callback) {
        var sql = "insert into food_review values (NULL, ?, ?, ?, ?)";
        db.execute(sql, [review.text, review.time, review.foodId, review.memberId], function(status) {
            callback(status);
        });
    },
}