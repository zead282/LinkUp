import { where } from "sequelize";
import posts from "../../../DB/models/posts.model.js";


export const createpost=async(req,res,next)=>{
    const{content,title}=req.body;
    const{id}=req.authUser
    if(!content) return res.json("add content");

    const post=await posts.create({content,title,userId:id});
    return res.json({message:"post created",post});
}

export const readpost=async(req,res,next)=>{

    const post=await posts.findAll()
    
    return res.json(post);
}


export const updatepost=async(req,res,next)=>{
    const{id}=req.authUser;
    const{pid}=req.params
    const{title,content}=req.body;
    const post=await posts.update({content,title},{where:{id:pid,userId:id}});
   
    if(!post) return res.json("post not found")
    
    return res.json({message:"post updatede",post});    
}

export const deletepost=async(req,res,next)=>{
    try {
        const {id } = req.authUser;
        const { pid } = req.params;
        

        // Delete the post
        const deleteCount = await posts.update({where:{isdeleted:true}},{
            where: { id:pid, userId:id }
        });

        if (deleteCount === 0) {
            // If no rows were deleted, return a 404 error
            return res.status(404).json({ error: "Post not found or user not authorized" });
        }

        // If deletion was successful, return success message
        return res.json({ message: "Post deleted successfully" });
    } catch (error) {
        console.error("Error deleting post:", error);
        return res.status(500).json({ error: "Internal server error" });
    }

}