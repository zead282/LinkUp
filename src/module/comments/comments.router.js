import { Router } from "express";
import * as commentcontroller from './comments.controller.js';
import { auth } from "../../middlewares/auth.middlewar.js";
import { endpointsroles } from "./endpoints.js";
const router=Router();
router.post('/add/:pid',auth(endpointsroles.all),commentcontroller.addcomment)

router.delete('/delete/:commentid/:postid',auth(endpointsroles.all),commentcontroller.deletecomment)
router.put('/update/:commentid/:postid',auth(endpointsroles.all),commentcontroller.updatecomment)
router.get('/read/:postid',commentcontroller.readcomments);

export default router;