import { createLink } from "../repositories/links.repository.js"
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

    } catch (e) {

    }
    res.send("urls/shorten")
}
///urls/open/:shortUrl"
export function redirectToLink(req, res) {
    try {

    } catch (e) {

    }
    res.send("urls/shorten")
}
//urls/:id
export function deleteLink(req, res) {
    try {

    } catch (e) {

    }
    res.send("urls/shorten")
}
//ranking
export function getLinksRank(req, res) {
    try {

    } catch (e) {

    }
    res.send("urls/shorten")
}
