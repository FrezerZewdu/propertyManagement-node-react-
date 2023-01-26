var express = require('express');
var bodyParser = require('body-parser');
var cors = require('cors');
var app = express();

app.use(bodyParser.urlencoded({ extended: true}));
app.use(bodyParser.json());
app.use(cors());

// Routes imported
const finishedGoods = require('./routes/finishedGoods')
const rawMaterials = require('./routes/rawMaterials')
const customer = require('./routes/customer')
const employee = require('./routes/employee')
const errorHandler = require('./middleware/error-handler')

//routes in use
app.use('/api/finishedgoods', finishedGoods)
app.use('/api/rawmaterials', rawMaterials)
app.use('/api/customer',customer)
app.use('/api/employee',employee)
app.use(errorHandler)

var port = process.env.PORT || 8090;
app.listen(port);
console.log('the api is running at '+port);
