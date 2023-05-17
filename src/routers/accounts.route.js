import { Router } from "express";
import { getUsersInfo, signIn, signUp } from "../controllers/accounts.controller.js";
import { validateConfirmedPassword } from "../middlewares/validateConfirmedPassword.js";
import { validateSchema } from "../middlewares/validate.js";
import { signUpSchema } from "../schemas/signUpSchema.js";


const accountsRoute = Router();
accountsRoute.post("/signup",validateConfirmedPassword, validateSchema(signUpSchema), signUp)
accountsRoute.post("/signin", signIn)
accountsRoute.get("/users/me", getUsersInfo)

export { accountsRoute }
