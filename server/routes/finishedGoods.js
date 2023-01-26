const express =require("express");
var config = require('../../dbconfig');
const sql = require('mssql');

const router = express.Router();

router.get('/', async (req, res) => {
  getFinishedGoods().then(result =>{
    res.json(result)
  })
})

router.post('/newgoods',async (req, res) =>{
    createFinishedGoods(req.body.finishedGoods).then(result =>{
        res.status(201).json(result);
    })
} )

// functions

async function getFinishedGoods(){
    try{
        let pool = await sql.connect(config);
        let requests = await pool.request()
            .query("select * from dbo.Finished_goods")
        return (requests.recordset)     
    }
    catch(error){
        console.log(error);
    }
}

async function createFinishedGoods(finishedGoods) {
    try {
        let pool = await sql.connect(config);
        let requests = await pool.request()
        .input('productName',sql.VarChar, finishedGoods.productName)
        .input('productCode',sql.VarChar,finishedGoods.productCode)
        .input('stockId',sql.Int,finishedGoods.stockId)
        .input('category',sql.VarChar,finishedGoods.category)
        .input('total_price',sql.Money,finishedGoods.totalPrice)
        .input('registeredBy', sql.Int, finishedGoods.registeredBy)
        .output('new_identity',sql.Int)
        .execute('dbo.spCreateFinishedGoods');
        console.log(await requests)
        return requests
    }
    catch(error){
        console.log(error)
    }
}

module.exports=router