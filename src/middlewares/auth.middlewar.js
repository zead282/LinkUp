import jwt from 'jsonwebtoken'
import users from '../../DB/models/user.model.js'

export const auth =(accessroles)=>{return async (req, res, next) => {
        try {
            const {accesstoken} = req.headers
            if (!accesstoken) return res.json("please login first")

            if (!accesstoken.startsWith(process.env.TOKEN_PREFIX)) return res.json("token invalid")

            const token = accesstoken.split(process.env.TOKEN_PREFIX)[1]

            const decodedData = jwt.verify(token, process.env.LOGIN_SIGNATURE)

            if (!decodedData || !decodedData.id) return res.json("invalid")

            
            const findUser = await users.findByPk(decodedData.id)
            if (!findUser) return res.json("user not found signup first")
            if (!accessroles.includes(findUser.role)) return res.json("you are not allowed")
            req.authUser = findUser
            next()
        } catch (error) {
            console.log(error);
            
        }
    }
}
