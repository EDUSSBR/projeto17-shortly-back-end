import { isOwner } from "../repositories/links.repository.js"

export async function checkOwner(req, res, next) {
    try {
        if (Number(req.params.id) > 0) {
            const {isOwnerResult, accountsLinksID} = await isOwner(req.tokenData.id, req.params.id)
            if (isOwnerResult) {
                req.accountsLinksID= accountsLinksID
                next()
            } else {
                res.status(401).send()
            }
        } else {
            res.status(404).send()
        }
    } catch (e) {
        console.log(e)
        res.status(401).send()
    }
}