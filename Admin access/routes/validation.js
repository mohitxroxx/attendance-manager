const validation={
    chk:function(req,res,next){
        if(req.isAuthenticated())
        return next();
        req.flash('LOGIN Required')
        res.redirect('/auth/login')
    },
    redirect:function(req,res,next){
        if(!req.isAuthenticated())
        return next();
        res.redirect('/profile')
    },
}

module.exports=validation