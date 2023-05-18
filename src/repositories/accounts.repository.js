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

export async function getAccountInfo(email) {
    const users = await db.query(`SELECT id, password FROM accounts WHERE email=$1`, [email]);
    return users.rows[0]
}

export async function getUsersInfoInDB(id){
    const userInfo = await db.query(`
    SELECT a.id, a.name, sum(l."visitCount") as "visitCount", json_agg(json_build_object('id', l.id, 'shortUrl', l."shortUrl", 'url', l.url, 'visitCount', l."visitCount")) as shortenedUrls
    FROM accounts_links al
    JOIN accounts a ON a.id = al."accountID"
    JOIN links l ON l.id = al."linkID"
    WHERE a.id = $1
    GROUP BY a.id, a.name;
`, [id]);
    return userInfo.rows
}