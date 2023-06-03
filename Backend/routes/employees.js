const express = require('express');
const router = express.Router();
const {Employees, validate} = require('../schema/employee');
const auth = require('../middleware/auth');
const admin = require('../middleware/admin');
const crypto = require('crypto');
const {Users} = require('../schema/user');
const { userInfo } = require('os');


router.get('/',[auth,admin], async (req,res) => {
    const employees = await Employees.find();
    if(!employees) return res.status(400).send("page not found");
    
    res.status(200).json(employees);
})

router.get('/:id',auth, async (req, res) => {
    const employee = await Employees.findById(req.params.id);
    if(!employee) return res.status(400).send("employee not found");

    res.status(200).json(employee);
})

router.post('/register',[auth,admin], async (req, res) => {

    const {error} = validate(req.body);
    if(error) return res.status(400).send(error.details[0].message);

    const verificationCode = crypto.randomBytes(4).toString('hex');

    const existingUserName = await Employees.findOne({userName: req.body.userName});
    const existingEamil = await Employees.findOne({email: req.body.email});

    if(existingEamil) return  res.status(400).send('email has been registered');
    if(existingUserName) return res.status(400).send('userName has been registered');
    
    const employee = new Employees({
        userName: req.body.userName, 
        fullName: req.body.fullName, 
        address: req.body.address,
        email: req.body.email,
        phoneNumber: req.body.phoneNumber,
        verificationCode: verificationCode,
    });

    try {
        res.status(200).json(await employee.save());
    }
    catch(err){
        console.log('Error: ' , err.message);
        res.status(400).send('invalid value', err.message);
    }
});

router.put('/:id',[auth,admin], async (req, res) => {
    const {error} = validate(req.body);
    if(error) return res.status(400).send(error.details[0].message);

    const employee = await Employees.findByIdAndUpdate(req.params.id, {
        userName: req.body.userName, 
        fullName: req.body.fullName, 
        address: req.body.address,
        email: req.body.email,
        phoneNumber: req.body.phoneNumber,
    },{new:true});

    if(!employee) return res.status(404).send("page not found");

    res.status(200).json(employee);   
});

// router.put('/:id/soldCars', async (req, res) => {
//         const employee = await Employees.findById(req.params.id);
//         employee.numberOfCarsSold++;
//         await employee.save();
//         res.status(200).json(employee);
// });


router.delete('/:id',[auth,admin], async(req, res) => {
    const employee = await Employees.findByIdAndRemove(req.params.id);
    if(!employee) return res.status(400).send("no employee with this id exists");
    res.status(200).json(employee);
});



module.exports = router;

// "userName": "utops", 
//         "fullName": "fullName", 
//         "address": "y.address",
//         "email": "reqemail@gmail.com",
//         "phoneNumber": "095687412",
//         "verificationCode":"0123546987"