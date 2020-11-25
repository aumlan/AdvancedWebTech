var express = require('express');
var memberModel = require.main.require('./model/memberModel');

var router = express.Router();

router.get('*', function(req, res, next) {
    if (req.session.uId != null) {
        next();
    } else {
        res.redirect('/login');
    }
});

router.get('/profile', (req, res) => {
    memberModel.get(req.session.uId, function(result) {
        if (result.length > 0) {
            res.render('member/profile', result[0]);
        }
    });
});



module.exports = router;