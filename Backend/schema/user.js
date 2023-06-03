const mongoose= require('mongoose');
const Joi = require('joi');
const jwt = require('jsonwebtoken');
const config = require('config');


const userSchema = new mongoose.Schema({
    userName :{
        type: String,
        required: true,
        trim: true,
        minlength:4,
        maxlength:40,
        unique: true,
    },

    password: {
        type:String,
        required:true,
        maxlength: 255,
        minlength: 8
    },

    email: {
        type: String,
        unique:true,
        maxlength: 100,
        minlength: 12,
        // required:true,
    },

    verificationCode: {
        type: String,
        required: true
    },

    isAdmin: Boolean
});


userSchema.methods.generateAuthToken = function(){
    const token = jwt.sign({_id: this._id, isAdmin: this.isAdmin},config.get('jwtPrivateKey'));
    return token;
};

const Users = mongoose.model('User', userSchema);

function validate(user){
    const schema = Joi.object({
        userName: Joi.string().required().min(4).max(40).trim(),
        password: Joi.string().required().min(8).max(255),
        email: Joi.string().required().min(10).max(100).email(),
        verificationCode: Joi.string().required(),
    });

    return schema.validate(user);
};

exports.validate = validate;
exports.Users = Users;
