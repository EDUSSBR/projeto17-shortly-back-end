export function validateConfirmedPassword(req, res, next) {
    const { password, confirmPassword } = req.body
    if (password!== undefined && password !==confirmPassword){
        return res.status(422).send("Password do not match confirmed password")
    }
    next()
}