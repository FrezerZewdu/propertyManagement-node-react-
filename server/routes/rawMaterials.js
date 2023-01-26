const express =require("express");
var config = require('../../dbconfig');
const sql = require('mssql');

const router = express.Router();

router.get('/', async (req, res) => {
    getRawMaterials().then(result=>{
        res.json(result)
    })
})

router.post('/createRaw', async (req, res)=>{
    createRawMaterials(req.body.rawMaterial).then(result=>{
        res.json(result)
    })
})

router.put('/withdrawal', async (req, res)=>{
    subtractRawMaterials(req.body.withdrawalRequest).then(result=>{
        res.json(result)
    })
})

router.get('/withdrawalReport/:date', async (req, res)=>{
    withdrawalReportByDate(req.params.date).then(result=>{
        res.json(result)
    })
})

router.get('/withdrawalReportEmployee/:id',async (req,res)=>{
    withdrawalReportByEmployeeID(req.params.id).then(result=>{
        res.json(result)
    })
})
// functions

// returns all raw materials in array
async function getRawMaterials () {
    try {
        let pool =  await sql.connect(config);
        let requests = await pool.request()
            .query("select * from dbo.Raw_materials")
            return (requests.recordset)  
    } catch (error) {
        console.log(error)
    }
}
// Parameters: raw material object
// returns id of newly created raw material
async function createRawMaterials(rawMaterial){
    try {
        let pool = await sql.connect(config)
        let requests = await pool.request()
        .input('name',sql.VarChar, rawMaterial.name)
        .input('materialCode', sql.VarChar,rawMaterial.materialCode)
        .input('packet',sql.Int,rawMaterial.packet)
        .input('totalPacket',sql.Int,rawMaterial.totalPacket)
        .input('price',sql.Money,rawMaterial.price)
        .input('totalPrice',sql.Money,rawMaterial.totalPrice)
        .input('weight',sql.Float,rawMaterial.weight)
        .input('registeredBy',sql.Int,rawMaterial.registeredBy)
        .output('new_identity',sql.Int)
        .execute('dbo.spCreateRawMaterials')
        return (requests.output.new_identity)
    } catch (error) {
        console.log(error)
    }
}
// parameters: material code and amount to be decreased from that stock
// returns id
async function subtractRawMaterials(withdrawalRequest){
    try {
        let pool = await sql.connect(config)
        let requests = await pool.request()
        .input('rmid',sql.Int,withdrawalRequest.rmid)
        .input('eid',sql.Int,withdrawalRequest.eid)
        .input('amount',sql.Int,withdrawalRequest.amount)
        .execute('dbo.spRawmaterialWithdrawal')
        return(requests.recordset)
    } catch (error) {
        console.log(error)
    }
}

async function withdrawalReportByDate(date){
    try {
        let pool = await sql.connect(config)
        let requests = await pool.request()
            .input('date',sql.Date,date)
            .execute('dbo.spWithdrawalReportByDate')
        return(requests.recordset)
    } catch (error) {
        console.log(error)
    }    
}

async function withdrawalReportByEmployeeID(id){
    try {
        let pool = await sql.connect(config)
        let requests = await pool.request()
            .input('employeeID',sql.Int,id)
            .execute('dbo.spWithdrawalReportByEmployeeID')
        return(requests.recordset)
    } catch (error) {
        console.log(error)
    }    
}
module.exports = router