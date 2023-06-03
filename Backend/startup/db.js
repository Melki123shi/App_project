const mongoose = require('mongoose');
const winston = require('winston');

module.exports = function() {
    mongoose.connect('mongodb://127.0.0.1/cars')
        .then(() => winston.info('succesfully connected to mogodb ...'));
}