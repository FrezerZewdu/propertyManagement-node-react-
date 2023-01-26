const express =require("express");
var config = require('../../dbconfig');
const sql = require('mssql');

const router = express.Router();

router.get('/', async (req,res)=>{
    getCustomers().then(result=>{
        res.json(result)
    })
})

router.post('/newCustomer', async(req,res)=>{
    createCustomer(req.body.customer).then(result=>{
        res.json(result)
    })
})

router.get('/customerInfo/:id', async(req,res)=>{
    getCustomerTransaction(req.params.id).then(result=>{
        res.json(result)
    })
})

// cutomer buying transaction

// Function

async function getCustomers(){
    try {
        let pool = await sql.connect(config)
        let requests = await pool.request()
        .query("select * from dbo.Customers")
        return (requests.recordset)
    } catch (error) {
        console.log(error)
    }
}

async function createCustomer(customer){
    try {
        let pool = await sql.connect(config)
        let requests = await pool.request()
            .input('firstName',sql.VarChar,customer.firstName)
            .input('lastName',sql.VarChar,customer.lastName)
            .input('phoneNumber',sql.VarChar,customer.phoneNumber)
            .output('new_identity',sql.Int)
            .execute('dbo.spCreateCustomer')
            return(requests.output.new_identity)
    } catch (error) {
        
    }
}

async function getCustomerTransaction(id){
    try {
        let pool = await sql.connect(config)
        let requests = await pool.request()
        .input('customerID', sql.Int, id)
        .execute('dbo.spCustomerTransaction')
        return (requests.recordset)
    } catch (error) {
        console.log(error)
    }
}


module.exports = router