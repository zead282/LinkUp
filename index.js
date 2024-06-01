import express from  'express';
import { dbconnection } from './DB/db.connection.js';
import userrouter from './src/module/users/users.router.js';
import postrouter from './src/module/posts/posts.router.js';
import commentrouter from './src/module/comments/comments.router.js';
import { config } from 'dotenv';
config({path:'./config/dev.config.env'})
const app=express();

app.use(express.json())
app.use('/post',postrouter);
app.use('/comment',commentrouter);
app.use('/user',userrouter);

dbconnection()



app.listen( process.env.PORT,()=>{console.log("server is runinng")})