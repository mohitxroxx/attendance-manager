const mongoose = require('mongoose')

const UserSchema=new mongoose.Schema({
        username: {
          type: String,
          required: true,
        },
        password: {
          type: String,
          required: true,
        },
        date: {
          type: Date,
          default: Date.now,
        },
        attendance: [
          {
            date: {
              type: Date,
              required:true
            },
            isPresent: {
              type: Boolean,
              required:true
            },
          },
        ]
    }
)

const users=mongoose.model('students',UserSchema)

module.exports=users;