const express = require('express')
const app = express()
const bodyParser = require('body-parser')
const config = require('config')

app.use(bodyParser.json())

const routerGet = require('./routes/mcu/alarm/show')
app.use('/mcu/alarm/show', routerGet)

const routerPost = require('./routes/mcu/alarm/dump')
app.use('/mcu/alarm/dump', routerPost.routerPost)

app.listen(
    config.get('api.port'), () => console.log('Tá tudo batendo!')
    )