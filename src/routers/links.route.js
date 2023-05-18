import { Router } from "express";
import { createShortenLink, deleteLink, getLinkByID, getLinksRank, redirectToLink } from "../controllers/links.controller.js";
import { authenticate } from "../middlewares/authenticationMiddleware.js";
import { validateSchema } from "../middlewares/validateSchema.js";
import { urlSchema } from "../schemas/createUrlSchema.js";
import { checkOwner } from "../middlewares/checkOwnership.js";


const linksRoute = Router();

linksRoute.post("/urls/shorten", authenticate, validateSchema(urlSchema), createShortenLink)
linksRoute.get("/urls/:id", getLinkByID)
linksRoute.get("/urls/open/:shortUrl", redirectToLink)
linksRoute.delete("/urls/:id", authenticate, checkOwner, deleteLink)
linksRoute.get("/ranking", getLinksRank)

export { linksRoute }
