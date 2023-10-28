const express=require('express')
const router=express.Router()
const {chk,redirect}=require('../routes/validation')

router.get('/'),redirect,(req,res)=>console.log('authenticated successfully')

router.get('/profile',chk,(req,res)=> console.log('Welcome to the app')
)

module.exports=router;