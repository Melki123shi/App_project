const auth = require('../middleware/auth');
const express = require('express');
const router = express.Router();
const {Users, validate} = require('../schema/user');
const bcrypt = require('bcrypt');
const _ = require('lodash');
const admin = require('../middleware/admin');
const {Employees} = require('../schema/employee');
const Joi = require('joi');

router.get('/' , [auth, admin],async(rea,res)=> {
    const user = await Users.find();
    res.send(user);
});

router.get('/me', auth, async(req,res)=>{
    const user = await Users.findById(req.user._id);
    res.send(user);
});

router.patch('/me', auth, async(req, res)=> {
    const {error} = validateupdate(req.body);n
    if(error) return res.status(400).send(error.details[0].message);


    if(req.body.password){
        const salt = await bcrypt.genSalt(10);
        newPassword = await bcrypt.hash(req.body.password, salt);
        req.body.password = newPassword;
    }

    const user = await Users.findByIdAndUpdate(req.user._id, {
        userName: req.body.userName,
        email: req.body.email,
        password: req.body.password
    },{new:true});

    res.status(200).json('profile updated'); 
});


router.post('/signup',async(req, res)=>{
    const {error} = validate(req.body);
    if(error) return res.status(400).send(error.details[0].message);

    let existinguser = await Users.findOne({userName: req.body.userName});
    if(existinguser) return res.status(400).send('User already exists');

    let existingEamil = await Users.findOne({email: req.body.email});
    if(existingEamil) return res.status(400).send('email already exists');

    const verificationCode = await Employees.findOne({verificationCode: req.body.verificationCode});
    if(!verificationCode) return res.status(400).send('verification code does not exists');

    let invalidEamil = await Employees.findOne({email: req.body.email});
    if(!invalidEamil) return res.status(400).send('use the email you registered with');

    const user = new Users(_.pick(req.body, ['userName','verificationCode','password','email']));
    const salt = await bcrypt.genSalt(10);
    user.password = await bcrypt.hash(req.body.password, salt);
    await user.save();

    const token = user.generateAuthToken();
    res.header('x-auth-token', token).send(_.pick(user, ['_id','userName','email','password']));

});


function validateupdate(user){
    const schema = Joi.object({
        userName: Joi.string().min(4).max(40).trim(),
        password: Joi.string().min(8).max(255),
        email: Joi.string().min(10).max(100).email(),
    });

    return schema.validate(user);
};
module.exports = router;

// "userName": "",
//         "password": "",
//         "email":""