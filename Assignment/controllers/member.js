var express = require('express');
var adminModel = require.main.require('./model/adminModel');
var memberModel = require.main.require('./model/memberModel');
var restaurantModel = require.main.require('./model/restaurantModel');
var foodModel = require.main.require('./model/foodModel');
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



module.exports = router;