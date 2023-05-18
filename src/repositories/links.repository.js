import db from '../db/database.js';

export async function createLink(accountID, url, shortUrl) {
    try {
        const queryResult = await db.query(`
        WITH linkID_table AS ( 
            INSERT INTO links(url, "shortUrl") VALUES ($1, $2)
            RETURNING id
        )
        INSERT INTO accounts_links ("accountID", "linkID")
        SELECT ${accountID}, id from linkID_table RETURNING "linkID" AS id;
        `, [url, shortUrl])
        return queryResult.rows[0]
        
    } catch (e) {
        console.log(e)
    }
}
export async function fetchLinkByID(linkID) {
    try {
        const queryResult = await db.query(`
        SELECT id, url, "shortUrl" FROM links WHERE id=$1;
        `, [linkID])
        return queryResult.rows[0]
        
    } catch (e) {
        console.log(e)
    }
}