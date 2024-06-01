import { DataTypes } from "sequelize";
import { db_config } from "../db.connection.js";

const users=db_config.define("user",{
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
    name:{type:DataTypes.STRING,allowNull:false},
    email:{type:DataTypes.STRING,unique:true},
    password:{type:DataTypes.STRING,allowNull:false},
    role:{type:DataTypes.ENUM('admin','user'),defaultValue:'user'},
    online:{type:DataTypes.BOOLEAN,defaultValue:true}
})

export default users;