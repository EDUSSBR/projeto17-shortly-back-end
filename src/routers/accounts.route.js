import { Router } from "express";
import { signUp } from "../controllers/accounts.controller.js";
import { validateConfirmedPassword } from "../middlewares/validateConfirmedPassword.js";
import { validateSchema } from "../middlewares/validate.js";
import { signUpSchema } from "../schemas/signUpSchema.js";


const accountsRoute = Router();
accountsRoute.post("/signup",validateConfirmedPassword, validateSchema(signUpSchema), signUp)

export { accountsRoute }
