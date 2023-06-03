const mongoose= require('mongoose');
const Joi = require('joi');
const phone = require('phone');


const employeeSchema = new mongoose.Schema({

    userName: {
        type: String,
        required: true,
        trim: true,
        minlength:3,
        maxlength:25,
        unique:true
    },

    fullName: {
        type: String,
        required: true,
        trim: true,
        minlength:5,
        maxlength:40,
    },

    address: {
        type: String,
        required: true,
        trim:true,
        minlength:2,
        maxlength:56,
    },

    email: {
        type: String,
        unique:true,
        maxlength: 1024,
        minlength: 12,
        required:true,
    },

    phoneNumber: {
        type: String,
        validator: function(v){
            const phoneNum = phone(v);
            return phoneNum.length > 0;
        },
        // write the form of phone numbers
        trim: true,
        required: true,
    },

    numberOfCarsSold: {
        type: Number, 
        required: true,
        default:0,
    },

    moneyGathered:{
        type: Number,
        default:0,
    },

    hiredDate: {
        type:Date,
        default: Date.now()
    },

    numberOfCreditLeft: {
        type: Number,
        default: 5,
    },

    verificationCode : {
        type: String,
        required: true,
    }

});

const Employees = mongoose.model('Employee', employeeSchema);

function validate(employee){
    const schema = Joi.object({
        fullName: Joi.string().required().min(5).max(40).trim(),
        userName: Joi.string().required().min(3).max(25).trim(),
        address: Joi.string().required().min(2).max(56).trim(),
        email: Joi.string().required().min(10).max(255).email(),
        phoneNumber: Joi.string().required(),
        numberOfCarsSold:Joi.number(),
        moneyGathered: Joi.number(),
        hiredDate: Joi.date(),
        numberOfCreditLeft: Joi.number(),
    });

    return schema.validate(employee);
};

exports.validate = validate;
exports.Employees = Employees;
exports.employeeSchema = employeeSchema;