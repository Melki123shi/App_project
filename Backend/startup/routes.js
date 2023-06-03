const express = require('express');
const auth = require('../routes/auth');
const users = require('../routes/user');
const employees = require('../routes/employees');
const credit = require('../routes/credit');
const cars = require('../routes/cars');
const error = require('../middleware/error');

module.exports = function(app) {
    app.use(express.json());
    app.use('/api/motors/', auth);
    app.use('/api/motors/users', users);
    app.use('/api/motors/employees', employees);
    app.use('/api/motors/cars', cars);
    app.use('/api/motors/credit', credit);
    app.use(error);
}




