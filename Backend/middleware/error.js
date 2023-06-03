const winston = require("winston")

module.exports = function (err, req, res, next){
    winston.error(err.message, err)
    //error
    //warn
    //info like connected to mongodb
    //verbo
    //debug
    //silly
    return res.status(500).send('Something Failed')
}