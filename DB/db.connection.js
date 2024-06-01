import { Sequelize } from "sequelize";

export const db_config=new Sequelize("facebook","root","",{host:"localhost",dialect:'mysql'})


export const dbconnection=async()=>{
    try {
        await db_config.sync({alter:true,force:false});
        console.log('Connection has been established successfully.');
      } catch (error) {
        console.error('Unable to connect to the database:', error);
      }
}