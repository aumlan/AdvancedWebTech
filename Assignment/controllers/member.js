var express = require('express');
var adminModel = require.main.require('./model/adminModel');
var memberModel = require.main.require('./model/memberModel');
var restaurantModel = require.main.require('./model/restaurantModel');
var foodModel = require.main.require('./model/foodModel');
var foodReviewModel = require.main.require('./model/foodReviewModel');

var router = express.Router();


var router = express.Router();

router.get('*', function(req, res, next) {
    if (req.session.uId != null) {
        next();
    } else {
        res.redirect('/login');
    }
});

router.get('/', (req, res) => {
    restaurantModel.getAll(function(results) {
        if (results.length > 0) {
            var restaurants = {
                name: req.session.uId,
                restaurantList: results
            };
            res.render('member/index', restaurants);
        } else {
            var restaurants = {
                name: req.session.uId,
                restaurantList: ""
            };
            res.render('member/index', restaurants);
        }
    });
});

router.get('/profile', (req, res) => {
    memberModel.get(req.session.uId, function(result) {
        if (result.length > 0) {
            res.render('member/profile', result[0]);
        }
    });
});


//*todo member review food

router.get('/restaurant/:restaurantId', (req, res) => {
    var restaurantDetails;
    restaurantModel.get(req.params.restaurantId, function(result) {
        if (result.length > 0) {
            restaurantDetails = result[0];
            foodModel.getAllByRestaurantId(req.params.restaurantId, function(results) {
                if (results.length > 0) {
                    var menu = {
                        restaurant: restaurantDetails,
                        menuList: results
                    };
                    res.render('member/restaurantMenu', menu);
                } else {
                    var menu = {
                        restaurant: restaurantDetails,
                        menuList: ""
                    };
                    res.render('member/restaurantMenu', menu);
                }
            });
        }
    });
});

router.get('/restaurant/:restaurantId/menu/review/:foodId', (req, res) => {
    console.log("db food review");
    console.log(req.params.foodId);
    foodReviewModel.getByFoodId(req.params.foodId, function(results) {
        if (results.length > 0) {
            console.log("get food review");
            var comments = {
                foodId: req.params.foodId,
                commentList: results
            };
            res.render('member/foodReview', comments);
        } else {
            console.log("not get food review");
            var comments = {
                foodId: req.params.foodId,
                commentList: ""
            }
            res.render('member/foodReview', comments);
        }
    });
});

//*todo AJAX XXXXXXXX
router.get('/foodReview/:foodId/:commentText', (req, res) => {
    var comment = {
        memberId: req.session.uId,
        text: req.params.commentText,
        time: new Date(),
        foodId: req.params.foodId
    };
    console.log("ajaxxx");

    console.log(comment.foodId);
    foodReviewModel.insert(comment, function(success) {
        if (success) {
            console.log("ajax done");
            foodReviewModel.getByFoodId(req.params.foodId, function(results) {
                if (results.length > 0) {
                    res.send(results);
                } else {
                    res.send(results);
                }
            });
        }
    });

});


//*todo food/menu details
router.get('/restaurant/:restaurantId/:foodID', (req, res) => {

    foodModel.get(req.params.foodID, function(result) {
        if (result.length > 0) {
            var foodDetails = {
                food: result[0]
            }
            console.log(result[0].F_IMAGE);
            res.render('member/foodDetails', foodDetails);
        }
    });
});

module.exports = router;