const express = require('express');
const bodyParser = require('body-parser');

const app = express();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// ----------------- ROUTES ---------------------- //

app.get('/', function (req, res, next) {
    res.json({ message: 'hooray! welcome to our api!' });  
})

app.get('/main', function (req, res, next) {
    res.send('Main Page');
});

app.post('/post', function (req, res, next) {
    console.log(req.body);
    res.status(200).json({status: true})
});  

// ----------------- ROUTES ---------------------- //

app.listen(3000, function () {
    console.log('Express API running on port 3000!');
})