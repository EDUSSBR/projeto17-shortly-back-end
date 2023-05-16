import { Router } from "express";


const accountsRoute = Router();
accountsRoute.post("/signup", (req, res) => {
    res.send("signup")
    
})
accountsRoute.post("/signin", (req, res) => {
    res.send("signin")
})


//auth
accountsRoute.get("/users/me", (req, res) => {
    res.send("/users/me")
})


export { accountsRoute }
