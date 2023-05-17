import { Router } from "express";
import { createShortenLink, deleteLink, getLinkByID, getLinksRank, redirectToLink } from "../controllers/links.controller.js";


const linksRoute = Router();

linksRoute.post("/urls/shorten", createShortenLink)
linksRoute.get("/urls/:id", getLinkByID)
linksRoute.get("/urls/open/:shortUrl", redirectToLink)
linksRoute.delete("/urls/:id",deleteLink)
linksRoute.get("/ranking", getLinksRank)

export { linksRoute }
