var express = require('express');
var adminModel = require.main.require('./model/adminModel');
var restaurantModel = require.main.require('./model/restaurantModel');
var router = express.Router();

router.get('*', function(req, res, next) {
    if (req.session.uId != null) {
        next();
    } else {
        res.redirect('/login');
    }
});

router.get('/', (req, res) => {
    var user = {
        name: req.session.uId
    };
    res.render('admin/index', user);
});
router.get('/profile', (req, res) => {
    adminModel.get(req.session.uId, function(result) {
        if (result.length > 0) {
            res.render('admin/profile', result[0]);
        }
    });
});
router.get('/editProfile', (req, res) => {
    adminModel.get(req.session.uId, function(result) {
        if (result.length > 0) {
            res.render('admin/editProfile', result[0]);
        }
    });
});
router.post('/editProfile', (req, res) => {
    var admin = {
        id: req.session.uId,
        name: req.body.name,
        address: req.body.address,
        email: req.body.email
    }
    adminModel.update(admin, function(success) {
        if (success) {
            console.log("sdfsdf");
            res.redirect('/admin/profile');
        } else {
            res.redirect('/admin/editProfile');
            console.log("no");
        }
    });
});

router.get('/addRestaurant', (req, res) => {
    res.render('admin/addRestaurant');
});
router.post('/addRestaurant', (req, res) => {
    var restaurant = {
        name: req.body.name,
        description: req.body.description,
        type: req.body.type,
        location: req.body.location,
        status: "VALID",

    };

    restaurantModel.insert(restaurant, function(success) {
        if (success) {
            res.redirect('/admin');
        } else {
            res.render("/admin/addRestaurant");
        }
    });
});

module.exports = router;