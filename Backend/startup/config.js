const config= require('config');

module.exports = function() {
if(!config.get("jwtPrivateKey")){
    throw new Error("FATAL ERROR jwtPrivateKey is not defined");
    // process.exit(1);//0 indicate exit except 0 is failure.
}
}