const express = require('express');
const router = express.Router();
const userModel = require.main.require('./models/userModel');
//const fs = require('fs');

router.get('/', (req, res) => {
    res.render('login/index');
});

router.post('/', (req, res) => {

    var user = {
        username: req.body.username,
        password: req.body.password
    }
    userModel.validate(user, function(status) {
        if (status) {
            res.cookie('uname', req.body.username);
            res.redirect('/home');
        } else {
            userModel.validate2(user, function(status) {
                if (status) {
                    res.cookie('uname', req.body.username);
                    res.redirect('/homeEmployer');
                } else {
                    res.redirect('/login');
                }
            });

        }
    });



});

module.exports = router;