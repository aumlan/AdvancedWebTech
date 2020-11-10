const express = require('express');
const router = express.Router();
const userModel = require.main.require('./models/userModel')

router.get('*', (req, res, next) => {
    if (req.cookies['uname']) {
        next();
    } else {
        res.redirect('/login');
    }
});

router.get('/create', (req, res) => {

    res.render('user/create');

});

router.post('/create', (req, res) => {

    var user = {
        name: req.body.name,
        username: req.body.username,
        company_name: req.body.company_name,
        contact: req.body.contact,
        password: req.body.password,
    }
    userModel.insert(user, function(status) {
        if (status) {
            res.redirect('/home/userlist');
        } else {
            res.redirect('/user/create');
        }
    });
});

router.get('/edit/:username', (req, res) => {

    var currentUser = {
        username: req.params.username,
        password: req.params.password,

    };
    res.render('user/edit', currentUser);
});

router.post('/edit/:username', (req, res) => {

    var user = {

        username: req.params.username,
        password: req.body.password,

    };
    userModel.update(user, function(status) {
        if (status) {
            res.redirect('/home/userlist');
        } else {
            res.redirect('/user/edit');
        }
    });
});

router.get('/delete/:username', (req, res) => {


    var currentUser = {
        username: req.params.username,

    };
    res.render('user/delete', currentUser);
});

router.post('/delete/:username', (req, res) => {

    var user = {
        username: req.params.username,
    };
    userModel.delete(user, function(status) {
        if (status) {
            res.redirect('/home/userlist');
        } else {
            res.redirect('/user/delete');
        }
    });
});

module.exports = router;