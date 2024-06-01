import { where } from "sequelize";
import comments from "../../../DB/models/comments.model.js";
import posts from "../../../DB/models/posts.model.js";

export const addcomment=async(req,res,next)=>{
    const{id}=req.authUser;
    const{pid}=req.params;
    const{content}=req.body;

    const checkpost=await posts.findOne({where:{id:pid}});
    if(!checkpost) return res.json("post not found");
    const addcomment=await comments.create({content,userId:id,postId:pid});

    if(!addcomment) return res.json("somthing wrong happen");

    return res.json({message:"comment added",content});
}


export const deletecomment=async(req,res,next)=>{
    const{commentid,postid}=req.params;
    const{id}=req.authUser;
    const postcheck=await posts.findOne({where:{id:postid}})
    if(!postcheck) return res.json("post not found");
    const findcomment=await comments.destroy({where:{id:commentid,postId:postid,userId:id}}) ///comment on this post and author only can delete

    if(!findcomment) return res.json("comment not found");
    return res.json("deleted success");
}

export const updatecomment=async(req,res,next)=>{

    const{commentid,postid}=req.params;
    const{id}=req.authUser;
    const{content}=req.body
    const postcheck=await posts.findOne({where:{id:postid}})
    if(!postcheck) return res.json("post not found");
    const findcomment=await comments.update({content},{where:{id:commentid,postId:postid,userId:id}}) ///comment on this post and author only can update

    if(findcomment[0]===0) return res.json("comment not found");
    return res.json({message:"updated",findcomment});

}

export const readcomments=async(req,res,next)=>{
    const{postid}=req.params;
    const checkonpost=await posts.findOne({where:{id:postid}});
    if(!checkonpost) return res.json("post not found");

    const commentss=await comments.findAll({where:{postId:postid}});

    if(commentss.length==0) return res.json("no comments");
    return res.json({message:"comments",commentss});

}