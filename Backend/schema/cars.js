const Joi = require('joi');
const mongoose = require('mongoose');
const JoiObjectId = require('joi-objectid');

const carSchema = mongoose.Schema({
    carId: {
        type: String,
        required: true,
        unique: true
    },

    make:{
        type:String,
        required :true,
        minlength:3,
        maxlength:50,
    },
    //if the type is string the url is stored in the db
    //if type is buffer the picture itself is stored in db
    photo: {
        type:String,
        required:true,
    },
    color:{
        type:String,
        required :true,
        minlength:3,
        maxlength:50, 
    },
    model:{
        type:String,
        required:true,
        minlength:1,
        maxlength:50,
    },
    horsePower:{
        type:Number,
        required:true,
    },
    safetyFeatures:{
        type:Array,
        required:true
    },
    isAutomatic:{
        type:Boolean,
        default:true,
    },
    price:{
        type:Number,
        required : true,
    },

    dayBought : {
        type: Date,
        default: Date.now(),
    },

    daySold : {
        type: Date,
    },

    isSold: {
        type:Boolean,
        required:true,
        default: false
    },
    negotiationlimit: {
        type: Number,
        required:true

    },

    byCredit: {
        type: Boolean,
        required: true,
        default : false,
    },

    byNegotiation: {
        type: Boolean,
        required: true,
        default : false,
    },

    negotiationPrice: {
        type: Number,
    },

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

    creditLimit: {
        type: Number,
        required: true,
        default : 0
    },

    priceSoldWith: {
        type: Number,
    }

});

const Cars = mongoose.model('Car', carSchema);

function validate(car) {
    Joi.objectId = JoiObjectId(Joi);
    const schema = Joi.object({
        employeeId: Joi.objectId(),
        isSold: Joi.bool(),
        make: Joi.string().required().min(3).max(50),
        model: Joi.string().required().min(1).max(50),
        carId: Joi.string().required(),
        photo:Joi.string().required(),
        color: Joi.string().required().min(1).max(50),
        horsePower: Joi.number().required(),
        safetyFeatures: Joi.array().required(),
        price: Joi.number().required(),
        priceSoldWith: Joi.number(),
        negotiationlimit: Joi.number().required(),
        isAutomatic: Joi.bool(),
        daySold : Joi.date(),
        dayBought: Joi.date(),
        creditLimit: Joi.number(),
        priceSoldWith: Joi.number(),
    });

    return schema.validate(car);
}

exports.validate = validate;
exports.Cars = Cars;
exports. carSchema = carSchema;