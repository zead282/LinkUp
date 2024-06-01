import { db_config } from "../db.connection.js";
import users from "./user.model.js";
import { DataTypes } from "sequelize";
const posts=db_config.define("post",{
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
    content:{type:DataTypes.STRING,allowNull:false},
    title:{type:DataTypes.STRING},
    isdeleted:{type:DataTypes.BOOLEAN,defaultValue:false},
    
})
users.hasMany(posts);
posts.belongsTo(users);


export default posts;