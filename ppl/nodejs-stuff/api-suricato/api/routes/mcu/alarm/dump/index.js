const routerPost = require('express').Router()

var control01, control02;
var device01, device02;
var dataIncoming;

var dataAlarm = {
    "alarms" : {
        "suricato-01": 
        {
            "device": device01,
            "control": control01 
        },

        "suricato-02": 
        {
            "device": device02,
            "control": control02
        } 
    }
}


routerPost.use('/', (req, res, next) => {
    const dataIncoming = req.body.alarms

    if(dataIncoming.device == "device/Alarm1"){
        device01 = dataIncoming.device
        control01 = dataIncoming.control
        console.log(device01)
    }

    /* if(alarms[0] == "suricato-02"){
        device02 = alarms["suricato-02"]["device"]
        control02 = alarms["suricato-02"]["control"]
        console.log(device02)
    } */
    res.status(200).json({ status: true })
})

module.exports = {
    routerPost, 
    dataAlarm
}