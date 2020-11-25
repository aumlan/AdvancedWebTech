var express = require('express');
var adminModel = require.main.require('./model/adminModel');
var restaurantModel = require.main.require('./model/restaurantModel');

var foodModel = require.main.require('./model/foodModel');
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

//*todo edit profile
router.get('/editProfile', (req, res) => {
    adminModel.get(req.session.uId, function(result) {
        if (result.length > 0) {
            res.render('admin/editProfileDetails', result[0]);
        }
    });
});
router.post('/editProfile', (req, res) => {
    console.log("addddddmin");
    var admin = {
        id: req.session.uId,
        name: req.body.name,
        address: req.body.address,
        email: req.body.email
    }
    adminModel.update(admin, function(success) {
        if (success) {
            res.redirect('/admin/profile');
        } else {

            res.redirect('/admin/editProfile');

        }
    });
});

//*todo edit profile endddddddd


//*todo add restaurant
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

//*todo add restaurant endddddddd


//*todo edit restaurant
router.get('/restaurants', (req, res) => {
    restaurantModel.getAll(function(results) {
        if (results.length > 0) {
            var restaurants = {
                restaurantList: results
            };
            res.render('admin/restaurantList', restaurants);
        }
    });
});

router.post('/restaurant/edit/:restaurantId', (req, res) => {

    var restaurant = {
        id: req.body.id,
        name: req.body.name,
        description: req.body.description,
        type: req.body.type,
        location: req.body.location,
        status: "VALID",
    };
    restaurantModel.update(restaurant, function(success) {
        if (success) {
            res.redirect('/admin/restaurants');
        } else {
            res.render("/admin/restaurant/edit/" + req.params.restaurantId);
        }
    });
});

//*todo edit restaurant endd


//*todo add menu
router.get('/restaurant/addMenu1/:restaurantId', (req, res) => {
    restaurantModel.get(req.params.restaurantId, function(result) {
        if (result.length > 0) {
            res.render('admin/addMenu1', result[0]);
        }
    });
});

router.post('/restaurant/addMenu1/:restaurantId', (req, res) => {
    console.log("ad mmenuu");
    var food = {
        title: req.body.title,
        description: req.body.description,
        image: "/pictures/" + res.req.file.filename,
        restaurantId: req.params.restaurantId
    };
    foodModel.insert(food, function(success) {
        if (success) {
            res.redirect('/admin/restaurant/view/' + req.params.restaurantId);
        } else {
            res.redirect("/admin/restaurant/addMenu/" + req.params.restaurantId);
        }
    });
});

router.get('/restaurant/:restaurantId/menu/delete/:menuId', (req, res) => {
    foodModel.get(req.params.menuId, function(result) {
        if (result.length > 0) {
            res.render('admin/deleteMenu', result[0]);
        }
    });
});

router.post('/restaurant/:restaurantId/menu/delete/:menuId', (req, res) => {
    foodModel.delete(req.params.menuId, function(success) {
        if (success) {
            res.redirect('/admin/restaurant/view/' + req.params.restaurantId);
        } else {
            res.redirect('/admin/restaurant/' + req.params.restaurantId + '/menu/delete/' + req.params.menuId);
        }
    });
});












module.exports = router;