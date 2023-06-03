const express  = require('express');
const winston = require('winston');
const app = express();

require('./startup/logging');
require('./startup/routes')(app);
require('./startup/db')();
require('./startup/config')();
require('./startup/validation')();


const PORT = process.env.PORT || 3000
app.listen(PORT, ()=>winston.log(`connected to port ${PORT}`));