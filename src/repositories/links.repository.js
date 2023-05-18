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

export async function isOwner(accountID, linkID) {
    try {
        const queryResult = await db.query(`
        SELECT * FROM accounts_links WHERE "accountID"=$1 AND "linkID"=$2;
        `, [accountID, linkID])
        const isOwnerResult = queryResult.rowCount > 0
        if (isOwnerResult) {
            return { isOwnerResult, accountsLinksID: queryResult.rows[0].id }
        }
        return { isOwnerResult: false, accountsLinksID: ""}
    } catch (e) {
        console.log(e)
    }
}
export async function deleteLinkFromDB(linkID, accountsLinksID) {
    try {
        const queryResult = await Promise.all([
            db.query(`
            DELETE FROM accounts_links WHERE id=$1;
        `, [accountsLinksID]),
            db.query(`
            DELETE FROM links WHERE id=$1;
        `, [linkID])    
    ])
    if (queryResult[0].rowCount===1 && queryResult[1].rowCount===1){
        return true
    }
    } catch (e) {
        console.log(e)
    }
}

export async function incrementVisitCount(shortUrl){
    try {
        const queryResult  = await db.query(`UPDATE links SET "visitCount"="visitCount"+1 WHERE "shortUrl"=$1`, [shortUrl]) 
        return queryResult.rowCount===1
    } catch (e) {
        console.log(e)
    }
}

export async function fetchLinkByShortUrl(shortUrl) {
    try {
        const queryResult = await db.query(`
        SELECT url FROM links WHERE "shortUrl"=$1;
        `, [shortUrl])
        return queryResult.rows[0]

    } catch (e) {
        console.log(e)
    }
}