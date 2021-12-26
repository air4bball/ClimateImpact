const { notEqual } = require('assert')
const express = require('express')
const mongoose = require('mongoose')
var app = express()
var Data = require('./userSchema')

mongoose.connect("mongodb://localhost/myDB")

mongoose.connection.once("open", function(){
    console.log("Connected to Database")
}).on("error", function(error){
    console.log("Failed to connect " + error)
})

// create a user
// post a request
app.post("/create", function(req,res){
    var user = new Data({
        user: req.get("user"),
        username: req.get("username"),
        password: req.get("password"),
        address: req.get("address"),
        city: req.get("city"),
        state: req.get("state"),
        zipCode: req.get("zipCode"),
        county: req.get("county"),
        commuteTime: req.get("commuteTime"),
        commute: req.get("commute"),
    })
    user.save().then(function(){
       if(user.isNew == false ) {
           console.log("Data saved")
           res.send("Data saved")
       } else{
           console.log("Data failed to save")
       }
    })
})

//http://192.168.0.100:8081/create
var server = app.listen(8081,"192.168.0.100", function(){
    console.log("Server running")
})

// delete a user
// post a request
app.post("/delete", function(req,res){
    Data.findOneAndRemove({
        _id: req.get("id")
    }, function(err){
        console.log("Failed " + err)
    })
    res.send("Deleted")
})


// update a user
// post a request
app.post('/update', function(req,res){
    Data.findOneAndUpdate({
        _id: req.get("id")
    },{
        user: req.get("user"),
        username: req.get("username"),
        password: req.get("password"),
        address: req.get("address"),
        city: req.get("city"),
        state: req.get("state"),
        zipCode: req.get("zipCode"),
        county: req.get("county"),
        commuteTime: req.get("commuteTime"),
        commute: req.get("commute"),
    },(err)=>{
        console.log("Failed to update " + err)
    })
    res.send("Updated")
})

// fetch all users
// get a request
app.get('/fetch', function(req,res){
    Data.find({}).then(function(DBitems){
        res.send(DBitems)
    })
})