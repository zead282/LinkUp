import { db_config } from "../db.connection.js";
import users from "./user.model.js";
import posts from "./posts.model.js";
import { DataTypes } from "sequelize";
const comments=db_config.define("comment",{
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
    content:{type:DataTypes.STRING},
})
users.hasMany(comments);
comments.belongsTo(users);

posts.hasMany(comments);
comments.belongsTo(posts);


export default comments;