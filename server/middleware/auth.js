const jwt = require('express-jwt')
const config = require('../../config.json')

module.exports = authorize

function authorize(roles = []){
    if (typeof roles === []){
        roles = [roles]
    }
    return [
        (req,res,next)=> {
            const token = req.header("x-auth-token")
            if(!token) {
                return res.status(401).send({
                    ok: false,
                    error: "Access denied. No token provided"
                })
            }

            try{
                const decoded = jwt.verify(token,config.secret)
                req.user = decoded
            }catch(error){
                return res.status(401).send({
                    ok: false,
                    error: "Token exprired"
                })
            }
            if(roles.length && !roles.includes(req.user.role)){
                return res.status(401).json({message: 'Unauthorized'})
            }
            next();
        }
    ]

}