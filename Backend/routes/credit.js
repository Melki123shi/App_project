const express = require('express');
const router = express.Router();
const {Credits, validate} = require('../schema/credit');
const {Cars} = require('../schema/cars');
const auth = require('../middleware/auth');
const admin = require('../middleware/admin');
const {Employees}  = require('../schema/employee');
const { Customers } = require('../schema/customer');
const Joi = require('joi');

router.get('/pending', [auth,admin], async(req,res)=> {
    const credit = await Credits.find();
    if(!credit) return res.status(400).send("credit not found");

    const pendingCredit =  credit.filter(c => c.status == "pending");
    res.status(200).json(pendingCredit);
});

router.get('/approved', auth, async(req,res)=> {
    const credit = await Credits.find();
    if(!credit) return res.status(400).send("credit not found");
    const approvedCredit =  credit.filter(c => c.status == "approved");
    res.status(200).json(approvedCredit);
});

router.put('/:id/approve', [auth,admin], async(req,res)=>{//employee credit approved
    const credit = await Credits.findByIdAndUpdate(req.params.id, {status: 'approved'},{new:true});
    if(!credit) return res.status(400).send("credit not found");
    res.status(200).json(credit);

});

router.delete('/:id/reject',[auth,admin], async(req,res)=>{
    const credit = await Credits.findByIdAndRemove(req.params.id);
    if(!credit) return res.status(400).send("no credit");

    const car = await Cars.findById(credit.car._id);
    if(!car) return res.status(400).send("no car ");

    const employee = await Employees.findById(credit.employee._id);
    if(!employee) return res.status(400).send("no employee");
   
    try {
        car.isSold = false;
        car.priceSoldWith = 0
        car.byCredit = false;
        car.daySold = Date.now(),
        await car.save();

        employee.numberOfCarsSold-=1;
        employee.moneyGathered-=car.price;
        employee.numberOfCreditLeft+=1
        await employee.save();

        res.status(200).json("");
    }
    catch(err){
        console.log('Error: ' , err.message);
        res.status(400).json('invalid value', err.message);
    }
});


router.get('/',[auth,admin], async (req,res) => {
    const credits = await Credits.find();
    if(!credits) return res.status(400).send("page not found");
    res.status(200).json(credits)
});

router.get('/:id',[auth,admin], async (req,res) => {
    const credit = await Credits.findById(req.params.id);
    if(!credit) return res.status(400).send("credit not found");
    res.status(200).json(credit)
});

router.post('/request',auth ,async (req, res) => {
    const {error} = validate(req.body);
    if(error) return res.status(400).send(error.details[0].message);

    const employee = await Employees.findOne({userName: req.body.userName});
    if(!employee) return res.status(400).send('no employee found');
    if(employee.numberOfCreditLeft <= 0) res.status(400).send("no more credits left");
 
    const car = await Cars.findOne({carId: req.body.carId});
    if(!car) return res.status(400).send('car not found');

    if(car.creditLimit == 0) return res.status(400).send('no credit available for this car');
    if(car.creditLimit < (car.price - req.body.paidAmount)) return res.status(400).send('no credit available for this car with this amount');

    if(car.isSold == true) return res.status(400).send('car not found');

    if(req.body.daySold){
        car.daySold = req.body.daySold;
    }else{
        car.daySold = Date.now();
    }

    const customer = new Customers({
        idPhoto:req.body.customeridPhoto,
        fullName:req.body.customerfullName,
    });

    try {
        await customer.save();
    }
    catch(err){
        console.log('Error: ' , err.message);
        res.status(400).send('invalid value', err.message);
    }

    const credit = new Credits({
        employee: {
            _id: (employee._id).toString(),
            fullName:employee.fullName,
        },
        takenDate:req.body.takenDate,
        paidDate:req.body.paidDate,
        paidAmount:req.body.paidAmount,
        car: {
            _id: (car._id).toString(),
            model: car.model,
            creditAmount: car.creditAmount,
        },
        customer: {
            _id: (customer._id).toString(),
            idPhoto:customer.idPhoto,
            fullName:customer.fullName,
        },
    });
    credit.remainingAmount = car.price - credit.paidAmount

    try {
        await credit.save();

        car.isSold = true;
        car.priceSoldWith = car.price
        car.byCredit = true;
        await car.save();

        employee.numberOfCarsSold+=1;
        employee.moneyGathered+=car.price;
        employee.numberOfCreditLeft-=1
        await employee.save();

        res.status(200).json(credit);
    }
    catch(err){
        console.log('Error: ' , err.message);
        res.status(400).json('invalid value', err.message);
    }
    
});

// router.put('/paid/:id', async(req,res)=> {
//     const car = await Cars.findById(req.params.id);
//     car.remainingAmount -= req.body.paidAmount;

//     try {
//         await car.save();
//     }
//     catch(err){
//         console.log('Error: ' , err.message);
//         res.status(400).send('invalid value', err.message);
//     }

//     if(car.remainingAmount <= 0){
//         const credit = await Credits.findOneAndUpdate(credit.customer.idPhoto,{
//             dealPaper:  req.body.dealPaper,
//         },{new:true});

//         if(!credit) return res.status(404).send("customer not found");
//         try {
//             await credit.save();
//         }
//         catch(err){
//             console.log('Error: ' , err.message);
//             res.status(400).send('invalid value', err.message);
//         }
//     }
    
// });

router.put('/:id',[auth,admin], async (req, res) => {
    const {error} = validateupdate(req.body);
    if(error) return res.status(400).send(error.details[0].message);

    const car = await Cars.findById(req.body.carId);
    if(!car) return res.status(404).send('car not found');
    
    const credit = await Credits.findByIdAndUpdate(req.params.id,{
        customer:req.body.customer,
        takenDate:req.body.takenDate,
        paidDate:req.body.paidDate,
        paidAmount:req.body.paidAmount,
        remainingAmount:req.body.remainingAmount,
        status:req.body.status,  
       
    },{new:true});

    if(!credit) return res.status(404).send("credit not found");

    const customer = await Customers.findOneAndUpdate(credit.customer.idPhoto,{
        idPhoto:req.body.customeridPhoto,
        fullName:req.body.customerfullName,
    },{new:true});

    credit.customer.idPhoto = req.body.customeridPhoto;
    credit.customer.fullName = req.body.customerfullName;

    if(!customer) return res.status(404).send("customer not found");
    
    try {
        await credit.save();
        await customer.save();
    }
    catch(err){
        console.log('Error: ' , err.message);
        res.status(400).send('invalid value', err.message);
    }
    

    res.status(200).json("succesfully updated!");
    
});

// router.get('/',auth, async(req, res) => {
//     const cars = await Cars.find();
//     if(!cars) return res.status(400).send("completed credit page not found");
//     const compcars =  cars.filter(c => c.isSold == false);
//     res.status(200).json(soldCars);
//     res.status(200).json(credit);
// })

router.delete('/:id',[auth,admin], async(req, res) => {
    const credit = await Credits.findByIdAndRemove(req.params.id);
    if(!credit) return res.status(400).send("no credit with this id exists");
    res.status(200).json(credit);
});

function validateupdate(credit){
    const schema = Joi.object({
        carId: Joi.objectId(),
        employeeId: Joi.objectId(), 
        takenDate: Joi.date(),
        paidDate: Joi.date(),
        paidAmount: Joi.number(),
        remainingAmount: Joi.number(),
        status:Joi.string(),  
        dealPaper: Joi.string(),
        customeridPhoto:Joi.string(),
        customerfullName: Joi.string().min(5).max(40),
        customerbankStatement: Joi.string(),
        customerrequestPaper: Joi.string()
    });

    return schema.validate(credit);
};

module.exports = router;

