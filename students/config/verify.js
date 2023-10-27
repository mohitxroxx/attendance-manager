const LocalStrategy = require('passport-local').Strategy
const bcrypt = require('bcryptjs')
const users = require('../models/users.js')

module.exports = function(passport) {
  passport.use(
    new LocalStrategy({ usernameField:'username' }, (username, password) => {
      users.findOne({
        username: username
      }).then(user => {
        if (!user) {
          console.log('User not registered')
        }
        bcrypt.compare(password, user.password, (err,isMatch) => {
          if (err)
          throw err;
          if (isMatch)
            console.log('Logged in successfully',user.username)
            else
            console.log('Wrong password')
        })
      })
    })
  )
}