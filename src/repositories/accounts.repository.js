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
    const [userInfo, userInfo1] = await Promise.all([db.query(`
    SELECT a.id, a.name, sum(l."visitCount") as "visitCount", json_agg(json_build_object('id', l.id, 'shortUrl', l."shortUrl", 'url', l.url, 'visitCount', l."visitCount")) as "shortenedUrls"
    FROM accounts_links al
    JOIN accounts a ON a.id = al."accountID"
    JOIN links l ON l.id = al."linkID"
    WHERE a.id = $1
    GROUP BY a.id, a.name;
    `, [id]),
    db.query(`
    SELECT a.id, a.name, 0 AS "visitCount", ARRAY[]::text[] AS "shortenedUrls"
    FROM accounts a
    WHERE a.id = $1;
    `, [id])])
    console.log(userInfo)
    console.log(userInfo1)
    if (userInfo.rows.length===0){
        return userInfo1.rows[0]
    }
    return userInfo.rows[0]
}