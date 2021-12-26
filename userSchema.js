var mongoose = require("mongoose")
var Schema = mongoose.Schema

var user = new Schema({
    username: String,
    password: String,
    address: String,
    city: String,
    state: String,
    zipCode: String,
    county: String,
    commuteTime: String,
    commute: String,
    user: String,
})

const Data = mongoose.model("Data", user)
module.exports = Data
