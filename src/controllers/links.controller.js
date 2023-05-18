import { createLink, fetchLinkByID, deleteLinkFromDB } from "../repositories/links.repository.js"
import { generateShortLink } from "../utils/generateShotLink.js"


export async function createShortenLink(req, res) {
    try {
        const { url } = req.body
        const { id } = req.tokenData
        const shortUrl = generateShortLink()
        const result = await createLink(id, url, shortUrl)
        res.status(201).send({ id: result.id, shortUrl })
    } catch (e) {

        res.status(500).send()
    }
}
///urls/:id"
export async function getLinkByID(req, res) {
    try {
        const { id } = req.params
        const result = await fetchLinkByID(id)
        res.send(result)
    } catch (e) {
        res.status(500).send()
    }
}
///urls/open/:shortUrl"
export function redirectToLink(req, res) {
    try {

    } catch (e) {

    }
    res.send("urls/shorten")
}
//urls/:id
export async function deleteLink(req, res) {
    try {
        const deleted = await deleteLinkFromDB(req.params.id, req.accountsLinksID)
        if (deleted){
            res.status(204).send()
        }
    } catch (e) {
        console.log(e)
        res.status(500).send()
    }
}
//ranking
export function getLinksRank(req, res) {
    try {

    } catch (e) {

    }
    res.send("urls/shorten")
}
