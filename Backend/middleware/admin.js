module.exports = function(req, res, next){
    if(!req.user.isAdmin){
        res.status(403).send('Access denied.');
        next();
    }
    next();
}

/**"make":"vitz",
"color":"blue",
"model":"Toyota",
"horsePower":800,
"safetyFeatures":["cars"],
"isAutomatic":true,
"price":100000 */