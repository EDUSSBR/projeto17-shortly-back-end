import { Router } from "express";
import { getUsersInfo, signIn, signUp } from "../controllers/accounts.controller.js";
import { validateConfirmedPassword } from "../middlewares/validateConfirmedPassword.js";
import { validateSchema } from "../middlewares/validateSchema.js";
import { signUpSchema } from "../schemas/signUpSchema.js";
import { signInSchema } from "../schemas/signInSchema.js";
import { authenticate } from "../middlewares/authenticationMiddleware.js";


const accountsRoute = Router();
accountsRoute.post("/signup",validateConfirmedPassword, validateSchema(signUpSchema), signUp)
accountsRoute.post("/signin", validateSchema(signInSchema), signIn)
accountsRoute.get("/users/me", authenticate, getUsersInfo)

export { accountsRoute }
