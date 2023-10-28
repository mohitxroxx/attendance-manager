const express=require('express')
const router=express.Router()
const passport=require('passport')
const users=require('../models/users')
const bcrypt=require('bcryptjs')
const {redirect}=require('../routes/validation')

router.get('/login', redirect, (req, res) => res.render('Login'))
router.get('/register', redirect, (req, res) => res.render('Register'))

router.post('/register',(req,res)=>{
    const {username,password='12345678'}=req.body
    if(password.length<8 ||!password || !username){
        console.log('Make sure that all entries are filled and password is more than 7 characters')
    }
    else{
        users.findOne({username:username}).then(user=>{
            if(user){
                res.json({ message: 'username already exists' });
            }
            else{
                const newUser=new users({
                    username,
                    password
                })
                bcrypt.genSalt(10, (err, salt) => {
                    bcrypt.hash(newUser.password, salt, (err, hash) => {
                      if (err) throw err;
                      newUser.password = hash;
                      newUser.save().then(user => {
                        res.json({
                            message: 'You are now registered and can log in',
                            name: newUser.name
                          });
                          res.redirect('/users/login')
                        })
                        .catch(err=>console.log(err));
                    })
                })
            }
        })
    }
})

router.post('/login', (req, res, next) => {
    passport.authenticate('local', (err, user, info) => {
      if (err) {
        return next(err);
      }
      if (!user) {
        return res.status(401).json({message:info.message });
      }
      req.logIn(user, err => {
        if (err) {
          return next(err);
        }
        return res.status(200).json({message: 'Logged in successfully'});
      });
    })(req, res, next);
  });
  
router.get('/view-attendance', (req, res) => {
    res.json("present")
    users.findOne({ username: req.user.username }, (err, student) => {
      if (err) {
        console.log('Error:', err);
        res.status(500).send('Error');
      } else {
        res.json(student.attendance);
      }
    });
  }); 

router.get('/logout',function(req,res,next){
    req.logout(function(err){
        if(err)
        return next(err)
        console.log("logged out successfully")
        res.redirect('/')
    }) 
})

router.post('/resetpass', (req, res) => {
    const { username, newPassword } = req.body
    bcrypt.genSalt(10, (err, salt) => {
      bcrypt.hash(newPassword, salt, (err, hash) => {
        if (err) {
          console.log('Error:', err);
          res.status(500).send('Error changing password')
        } else {
          users.findOneAndUpdate(
            { username: username },
            { $set: { password: hash } },
            (err, user) => { 
              if (err) {
                console.log('Error:', err)
                res.status(500).send('Error changing password')
              } else {
                console.log('Password changed successfully')
                res.send('Password changed successfully')
              }
            }
          )
        }
      })
    })
})

module.exports=router;
