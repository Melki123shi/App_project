const Joi = require('joi');
const mongoose = require('mongoose');
const JoiObjectId = require('joi-objectid');

const creditSchema = new mongoose.Schema({
    employee:{
        type: new mongoose.Schema({
            fullName:{
                type: String,
                required: true,
                trim: true,
                minlength:5,
                maxlength:40,
            },
        })
    },
    status: {
        type: String,
        enum : ['pending', 'approved'],
        default: 'pending',
        required:true,
    },
    takenDate:{
        type:Date,
        trim:true,
        default:Date.now
    },
    paidDate:{
        type:Date,
        trim:true,
        default:Date.now,
    },
    paidAmount:{
        type:Number,
        required : true,
    },
    remainingAmount:{
        type:Number,
    },
    car:{
        type: new mongoose.Schema({
            model:{
                type:String,
                required:true,
                minlength:1,
                maxlength:50,
            },
            creditAmount: {
                type: Number,
                required: true,
                default: 0,
            }
        })
    },

    customer:{
        type: new mongoose.Schema({
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
        })
    },

});

const Credits = mongoose.model('Credit', creditSchema);

function validate(credit){
    const schema = Joi.object({
        carId: Joi.string().required(),
        userName: Joi.string().required(),
        takenDate: Joi.date(),
        paidDate: Joi.date(),
        paidAmount: Joi.number().required(),
        remainingAmount: Joi.number(),
        status:Joi.string(),  
        dealPaper: Joi.string(),
        customeridPhoto:Joi.string().required(),
        customerfullName: Joi.string().required().min(5).max(40),
        
    });

    return schema.validate(credit);
};

exports.validate = validate;
exports.Credits = Credits;
exports. creditSchema = creditSchema;