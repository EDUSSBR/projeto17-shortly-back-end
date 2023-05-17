import { createAccount, emailExists } from "../repositories/accounts.repository.js"
import bcrypt from "bcrypt"

export async function signUp(req, res) {
    try {
        const { name, email, password } = req.body
        const userExists = await emailExists(email)
        if (userExists) {
            return res.status(409).send()
        }
        const hashedPassword = bcrypt.hashSync(password, 10)
        await createAccount(name, email, hashedPassword)
        res.status(201).send()
    } catch (e) {
        console.log(e)
        res.status(500).send()
    }
}