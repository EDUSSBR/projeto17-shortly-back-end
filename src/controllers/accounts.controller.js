import { createAccount, emailExists, getAccountInfo } from "../repositories/accounts.repository.js"
import { createToken } from "../repositories/tokens.repository.js"
import bcrypt from "bcrypt"
import jwt from "jsonwebtoken"
import dotenv from 'dotenv';
dotenv.config()

export async function signUp(req, res) {
    try {
        const { name, email, password } = req.body
        const userExists = await emailExists(email)
        if (userExists) {
            return res.status(409).send()
        }
        const hashedPassword = bcrypt.hashSync(password, 10)
        const user = await createAccount(name, email, hashedPassword)
        res.status(201).send()
    } catch (e) {
        console.log(e)
        res.status(500).send()
    }
}


export async function signIn(req, res) {
    try {
        const {email, password} = req.body
        const accountInfo = await getAccountInfo(email)
        if (accountInfo?.id === undefined || accountInfo?.password === undefined){
            return res.status(401).send()
        }
        const isEqual = bcrypt.compareSync(password, accountInfo.password)
        if (isEqual){
            const token = jwt.sign({ id: accountInfo.id}, process.env.JWT_PASSWORD,  {expiresIn: '1d'})
            createToken(accountInfo.id, token)
            return res.send({token})
        }
        res.status(401).send()
    } catch (e) {
        console.log(e)
        res.status(500).send()
    }
}
export async function getUsersInfo(req, res) {
    try {

        res.send("ceate account")
    } catch (e) {
        console.log(e)
        res.status(512).send("ceate account")

    }
}