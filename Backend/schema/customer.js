const Joi = require('joi');
const mongoose = require('mongoose');

const customerSchema = new mongoose.Schema({
    idPhoto:{
        type: String,
        required: true,
    },
    
    fullName:{
        type:String,
        minlength:5,
        maxlength:50,
        required:true,
        trim:true,
    },
});

const Customers = mongoose.model('customer', customerSchema);

exports.Customers = Customers;
exports.customerSchema = customerSchema;