import { Router } from "express";


const linksRoute = Router();

//auth
linksRoute.post("/urls/shorten", (req, res) => {
    res.send("urls/shorten")

})

//no
linksRoute.get("/urls/:id", (req, res) => {
    res.send("/urls/:id")
})

linksRoute.get("/urls/open/:shortUrl", (req, res) => {
    res.send("/urls/open/:shortUrl")
})

//auth
linksRoute.delete("/urls/:id", (req, res) => {
    res.send("/urls/:id")
})
linksRoute.get("/ranking", (req, res) => {
    res.send("/ranking")
})

export { linksRoute }
