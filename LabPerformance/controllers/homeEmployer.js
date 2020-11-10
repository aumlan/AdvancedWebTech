const express = require('express');
const userModel = require.main.require('./models/userModel')
router = express.Router();

router.get('*', (req, res, next) => {
    if (req.cookies['uname']) {
        next();
    } else {
        res.redirect('/login')
    }
});

router.get('/', (req, res) => {
    res.render('homeEmployer/indexEmployer', { name: 'uname', id: '123' });

});

router.get('/jobList', (req, res) => {
    userModel.getAll(function(results) {

        res.render('home/jobList', { users: results });
    });


});

module.exports = router