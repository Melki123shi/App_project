const winston = require('winston');
require('winston-mongodb');
require('express-async-errors');

module.exports = function(){
    winston.handleExceptions(
        new winston.transports.Console({ colorize: true, prettyPrint: true }),
        new winston.transports.File({filename:'uncaughtExceptions.log'}),

        process.on('uncaughtException',(ex) => {
            throw ex;
        })
    );
    // process.on('uncaughtException', (ex)=>{
    //     console.log('we got uncaught exception');
    //     winston.error(ex.message, ex);
    // });
    
    // process.on('unhandledRejection', (ex)=>{
    //     console.log('we got unhandled rejection');
    //     winston.error(ex.message, ex);
    // });
    
    winston.add(winston.transports.File, {filename: 'logfile.log'});
    winston.add(winston.transports.MongoDB, {
        db: 'mongodb://127.0.0.1/cars',
        level: 'info'
    });
}

