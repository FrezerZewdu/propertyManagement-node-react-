const express =require("express");
var config = require('../../dbconfig');
const sql = require('mssql');
const jwt = require('jsonwebtoken')
const configS= require('../../config');
const authorize = require('../middleware/auth')
const router = express.Router();


router.get('/',async (req, res)=>{
//routes
// router.get('/',authorize("Admin"),async (req, res)=>{
    getEmployees().then(result=>{
        res.send(result)
    })
    .catch(err => next(err))
})

router.get('/:name',authorize("Admin"),async (req, res)=>{
    getEmployeeByName(req.params.name).then(result=>{
        res.send(result)
    })
    .catch(err => next(err))
})
router.post('/createEmployee',async (req,res)=>{
    createEmployee(req.body.employee).then(result=>{
        res.send(result)
    })
    .catch(err => next(err))
})
router.post('/login', async (req,res)=>{
    console.log(req.body.email)
    login(req.body.email,req.body.password).then(result=>{
        if(result){
            const token = jwt.sign({sub: result.id,role:result.Roles}, configS.secret)
            const { password, ...userWithoutPassword } = result
            return res.status(200).json({
                ...userWithoutPassword,
                token
            })
        }
        else{
            res.status(401).json({ message: 'Username or password is incorrect'})
        }
    })
    .catch(error => next(error))
})
router.delete('/terminate/:id',authorize("Admin"), async(req,res)=>{
    deleteEmployee(req.params.id).then(result=>{
        res.send(result)
    })
    .catch(err => next(err))
})

//functions
async function getEmployees(){
    try {
        let pool = await sql.connect(config)
        let requests = await pool.request()
            .execute('dbo.spGetEmployees') // procedsure
            return (requests.recordset)
    } catch (error) {
        console.log(error)
    }
}

async function getEmployeeByName(name){
    try {
        let pool = await sql.connect(config)
        let requests = await pool.request()
            .input('name',sql.VarChar,name)
            .execute('dbo.spGetEmployeeByName')
            return (requests.recordset)
    } catch (error) {
        console.log(error)
    }
}

async function login(username, password){
    try {
        console.log("inside login method")
        let pool = await sql.connect(config)
        let requests = await pool.request()
            .query("SELECT * from dbo.Employee WHERE email='"+username+"' AND password='"+password+"'")
            console.log(requests)
            return requests.recordset[0]
    } catch (error) {
        console.log(error)
    }
}

async function createEmployee(employee){
    try {
        console.log(employee)
        let pool = await sql.connect(config)
        let requests = await pool.request()
            .input('firstName',sql.VarChar,employee.firstName)
            .input('lastName',sql.VarChar,employee.lastName)
            .input('email',sql.VarChar,employee.email)
            .input('password',sql.NChar,employee.password)
            .input('departmentID',sql.Int,employee.departmentID)
            .input('roles', sql.VarChar,employee.roles)
            .output('new_identity',sql.Int)
            .execute('dbo.spCreateEmployee')
            return (requests.output)
    } catch (error) {
        console.log(error)
    }
}

async function deleteEmployee(id){
    try {
        let pool = await sql.connect(config)
        let requests = await pool.request()
            .query("DELETE FROM dbo.Employee WHERE id="+id)
        return requests.recordset
    } catch (error) {
        console.log(error)
    }
}

module.exports = router