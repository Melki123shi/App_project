const express = require('express');
const router = express.Router();
const {Users} = require('../schema/user');
const Joi = require('joi');
const bcrypt = require('bcrypt');
const auth = require('../middleware/auth');

router.post('/login', async(req, res)=> {
    const {error} = validate(req.body);
    if(error) return res.status(400).send(error.details[0].message);

    let user = await Users.findOne({email: req.body.email});
    if(!user) return res.status(400).send('invalid email or password');

    const validatePassword = await bcrypt.compare(req.body.password,user.password);
    if(!validatePassword) return res.status(400).send('invalide email or password');

    token = user.generateAuthToken();
    res.send(token);
});

router.get('/logout', (req, res)=>{
    req.session.destroy(function(){
      res.redirect('/login');
    });
  });
  

function validate(req){
    const schema = Joi.object({
        email: Joi.string().min(5).max(455).required().email(),
        password: Joi.string().min(5).max(455).required()
    });
    return schema.validate(req);
}
 
module.exports = router;