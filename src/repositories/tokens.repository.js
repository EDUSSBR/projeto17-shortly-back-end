import db from '../db/database.js';

export async function createToken(accountID, token) {
    await db.query(`INSERT INTO tokens("accountID", token) VALUES ($1, $2)`, [accountID, token]);
}