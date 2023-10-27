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
                console.log('Username already exists')
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
                          console.log('You are now registered and can log in', newUser.username)
                          res.redirect('/users/login')
                        })
                        .catch(err=>console.log(err));
                    })
                })
            }
        })
    }
})

router.post('/login',(req,res,next)=>{
    passport.authenticate('local',{
        successRedirect:'/dashboard',
        failureRedirect:'/auth/login',
    })(req,res,next)
})

router.get('/logout',function(req,res,next){
    req.logout(function(err){
        if(err)
        return next(err)
        res.redirect('/')
    })
})

// router.post('/resetpassword',function(req,res,next){
//     const {newp}=req.body;
// })

module.exports=router;