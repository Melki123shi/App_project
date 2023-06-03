const express = require('express');
const router = express.Router();
const {Cars, validate} = require('../schema/cars');
const auth = require('../middleware/auth');
const admin = require('../middleware/admin');
const {Employees} =  require('../schema/employee');
const {Users} = require('../schema/user');
const Joi =  require('joi');
const JoiObjectId = require('joi-objectid');


router.get('/',[auth,admin], async (req,res)=> {
    const cars = await Cars.find();
    if(!cars) return res.status(400).send("cars not found");
    res.status(200).json(cars);
});


router.get('/availableCars',auth, async (req, res) => {
    const cars = await Cars.find();
    if(!cars) return res.status(400).send("car not found");
    
    const soldCars =  cars.filter(c => c.isSold == false);
    res.status(200).json(soldCars);
});

router.get('/soldCars',[auth,admin], async (req, res) => {
    const cars = await Cars.find();
    if(!cars) return res.status(400).send("car not found");
    
    const soldCars =  cars.filter(c => c.isSold == true);
    res.status(200).json(soldCars);
});

router.get('/availableCars/:id',auth, async (req, res) => {
    const car = await Cars.findById(req.params.id);
    if(!car || car.isSold == true) return res.status(400).send("car not found");
    res.status(200).json(car);
});


router.post('/register',[auth,admin] ,async (req, res) => {
    const {error} = validate(req.body);
    if(error) return res.status(400).send(error.details[0].message);

    const car1 = await Cars.findOne({carId:req.body.carId});
    if(car1) return res.status(400).send("car with this is already registered");

    const car = await Cars.create({
        carId: req.body.carId,
        isSold: req.body.isSold,
        make: req.body.make,
        model:req.body.model,
        color:req.body.color,
        photo:req.body.photo,
        horsePower:req.body.horsePower,
        safetyFeatures:req.body.safetyFeatures,
        isAutomatic:req.body.isAutomatic,
        price: req.body.price,
        dayBought: Date.now(),
        negotiationlimit:req.body.negotiationlimit,
        creditAmount: req.body.creditAmount,
    });

    res.status(200).json(await car.save());
});

router.patch('/availableCars/:id/sell',auth,async(req,res)=> {

    const {error} = validatenegotiation(req.body);
    if(error) return res.status(400).send(error.details[0].message);

    const car = await Cars.findById(req.params.id);
    if(!car || car.isSold == true) return res.status(400).send("car not found");
    
    const userId = req.user._id;
    const user = await Users.findById(userId);
    if(user.isAdmin) {
        car.isSold = true;
        car.daySold = Date.now();
        await car.save();
        res.status(200).json('successfluy sold the car');
        res.status(200).json('car');
    }

    const employee = await Employees.findOne({email: user.email});
    
    if(req.body.negotiationPrice){
        if(car.negotiationlimit <= req.body.negotiationPrice && car.price >= req.body.negotiationPrice){
            car.byNegotiation = true
            car.isSold = true;
            car.priceSoldWith = req.body.negotiationPrice;
            employee.moneyGathered+= req.body.negotiationPrice;
        } 
        else{
            res.status(200).json('invalid negotiation price limit');
        }
    }else{
        car.priceSoldWith = car.price;
        employee.moneyGathered+= car.price;
    }
    employee.numberOfCarsSold++;
    car.daySold = Date.now();
    
    await employee.save();
    await car.save();
    res.status(200).json(car);

});

router.patch('/:id',[auth,admin], async (req, res) => {
    const {error} = validatecars(req.body);
    if(error) return res.status(400).send(error.details[0].message);

    const car = await Cars.findByIdAndUpdate(req.params.id,{
        make:req.body.make,
        color:req.body.color,
        photo:req.body.photo,
        model:req.body.model,
        horsePower:req.body.horsePower,
        safetyFeatures:req.body.safetyFeatures,
        isAutomatic:req.body.isAutomatic,
        price: req.body.price,
        isSold:req.body.isSold,
        negotiationlimit:req.body.negotiationlimit,
        creditLimit: req.body.creditLimit,
        priceSoldWith: req.body.priceSoldWith,
    },{new:true});


    if(!car) return res.status(404).send("page not found");
    res.status(200).json(car);
});

router.delete('/:id',[auth,admin], async(req, res) => {
    const car = await Cars.findByIdAndRemove(req.params.id);
    if(!car) return res.status(400).send("no car with this id exists");
    res.status(200).json(car);
});


function validatenegotiation(customer){
    const schema = Joi.object({
        negotiationPrice: Joi.number()
    });

    return schema.validate(customer);
};

function validatecars(cars){
    const schema = Joi.object({
        isSold: Joi.bool(),
        make: Joi.string().min(3).max(50),
        model: Joi.string().min(1).max(50),
        photo:Joi.string(),
        color: Joi.string().min(1).max(50),
        horsePower: Joi.number(),
        safetyFeatures: Joi.array(),
        price: Joi.number(),
        priceSoldWith: Joi.number(),
        negotiationlimit: Joi.number(),
        isAutomatic: Joi.bool(),
        daySold : Joi.date(),
        dayBought: Joi.date(),
        numberInStock: Joi.number(),
        creditLimit: Joi.number(),
        priceSoldWith: Joi.number(),
    });

    return schema.validate(cars);
};

module.exports = router;



// "make":"ferari",
// "color":"blue",
// "photo":"C:m/Desktop/cars_project/images/00001car.png",
// "model":"ferari",
// "horsePower":500,
// "safetyFeatures":["cars sit"],
// "isAutomatic":true,
// "price": 1000000,
// "isSold":false,
// "negotiationlimit":900000,
// "creditLimit": 200000,
// "carId":"1234"