const routerGet = require('express').Router()
const dataAlarm = require('../dump/')

routerGet.use('/', (req, res) => {
   /*  res.send(dataAlarm.dataAlarm)
    console.log(dataAlarm.dataAlarm) */
})

module.exports = routerGet