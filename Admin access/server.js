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
app.use('/auth',require('./routes/auth.js'))

const GoogleStrategy = require('passport-google-oauth').OAuth2Strategy;
const GOOGLE_CLIENT_ID = 'KEY NHI SHARE KRI JAATI';
const GOOGLE_CLIENT_SECRET = 'SAME KEY NHI DENI HOTI';
passport.use(new GoogleStrategy({
    clientID: GOOGLE_CLIENT_ID,
    clientSecret: GOOGLE_CLIENT_SECRET,
    callbackURL: "http://localhost:5000/auth/google/callback"
  },
  function(accessToken, refreshToken, profile, done) {
      userProfile=profile;
      return done(null, userProfile);
  }
));
 
app.get('/auth/google', 
  passport.authenticate('google', { scope : ['profile', 'email'] }));
 
app.get('/auth/google/callback', 
  passport.authenticate('google', { failureRedirect: '/error' }),
  function(req, res) {
    res.redirect('/success');
  });

const PORT=process.env.PORT || 5000
app.listen(PORT,console.log('server up and running on PORT',PORT))