import users from "../../../DB/models/user.model.js";
import comments from "../../../DB/models/comments.model.js";
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken'
import { where } from "sequelize";
import posts from "../../../DB/models/posts.model.js";

export const signup=async(req,res,next)=>{
    const{name,email,password}=req.body;
    
    const isemailexist=await users.findOne({where:{email}});
    if(isemailexist) return res.json({message:"email already exists"});

    const hashpass=bcrypt.hashSync(password,+process.env.SALT_ROUNDS);

    const newuser=await users.create({name,email,password:hashpass});
    return res.json({message:"user added",newuser});
    
}

export const signin=async(req,res,next)=>{

    const{email,password}=req.body;
    const finduser=await users.findOne({where:{email:email}});
    if(!finduser) return res.json("email not found")
    
    const checkpass=bcrypt.compareSync(password,finduser.password);
    if(!checkpass) return res.json("invalid pass");
    ////token
    const token=jwt.sign({id:finduser.id,name:finduser.name},process.env.LOGIN_SIGNATURE,{expiresIn:"1h"})    
    await users.update({online:true},{where:{id:finduser.id}})
    return res.json({message:"loggedin",token});
}

export const logout=async(req,res,next)=>{
    const{id}=req.authUser;
   const logoutt= await users.update({online:false},{where:{id:id}})
    // Remove the 'token' item from localStorage
    if(logoutt){
      
      return res.json("logged out")
    }


}

export const getspecificuser=async(req,res,next)=>{
  const{id}=req.authUser;
  const finduser=await users.findAll({include: [{
    model:comments,
    as: 'comments',
    attributes: ['id', 'content', 'userId', 'createdAt', 'updatedAt'] // Select the attributes you want to include
},{model:posts,as:'posts',attributes:['id','content','title']}]})

  if(!finduser) return res.json("user not found");

  return res.json(finduser);

}
