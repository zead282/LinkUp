import { Router } from "express";
import * as postcontroller from './posts.controller.js';
import { auth } from "../../middlewares/auth.middlewar.js";
import { endpointsroles } from "./endpoints.js";
const router=Router();

router.post('/add',auth(endpointsroles.add_post),postcontroller.createpost);

router.get('/read',postcontroller.readpost)
router.put('/update/:pid',auth(endpointsroles.update),postcontroller.updatepost);
router.delete('/delete/:pid',auth(endpointsroles.delete),postcontroller.deletepost);
export default router;