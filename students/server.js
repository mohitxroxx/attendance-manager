const express=require('express')
const dotenv=require('dotenv')
const session=require('express-session')
const passport=require('passport')

require('./config/verify.js')(passport);
const connectDB = require('./config/db')
dotenv.config({path:'./config/config.env'})
connectDB()

const app=express()

app.use(express.urlencoded({
    extended: true
}));

app.use(session({
      secret: 'secret',
      resave: true,
      saveUninitialized: true
    })
  );
  
app.use(passport.initialize())
app.use(passport.session())

app.use('/',require('./routes/home.js'))
app.use('/users',require('./routes/auth.js'))

const PORT=process.env.PORT || 5000
app.listen(PORT,console.log('server up and running on PORT',PORT))