import db from '../db/database.js';

export async function emailExists(email) {
    const users = await db.query(`SELECT id FROM accounts WHERE email=$1`, [email]);
    return users.rowCount > 0
}
export async function createAccount(name, email, hashedPassword) {
    try{
        const users = await db.query(`INSERT INTO accounts (name, email, password) VALUES ($1, $2, $3)`, [name, email, hashedPassword]);
        return 
    } catch (e){
        console.log(e)
    }
}