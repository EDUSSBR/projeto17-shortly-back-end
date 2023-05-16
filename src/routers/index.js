import {Router } from 'express';
import { accountsRoute } from './accounts.route.js';
import { linksRoute } from './links.route.js';


const route = Router()

route.use(accountsRoute)
route.use(linksRoute)

export default route;
