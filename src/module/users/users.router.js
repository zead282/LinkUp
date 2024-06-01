import { Router } from "express";
import * as usercontroller from './users.controller.js';
import { auth } from "../../middlewares/auth.middlewar.js";
import { endpointsroles } from "./endpoints.js";
const router=Router();

router.post('/add',usercontroller.signup);
router.get('/login',usercontroller.signin);
router.put('/logout',auth(endpointsroles.all),usercontroller.logout)
router.get('/',auth(endpointsroles.all),usercontroller.getspecificuser)
export default router;