import  type{ JwtPayload, SignOptions } from "jsonwebtoken"
import jwt from "jsonwebtoken"

const CreateJWTToken = (payload:JwtPayload,secret:string,expiresIn:SignOptions)=>{
    const createdToken = jwt.sign(payload,secret,{expiresIn}as SignOptions);

    return createdToken;
};


const VerifyJWTToken = (token:string,secret:string)=>{

    try {
        const verifiedToken = jwt.verify(token,secret)

        return {
            success: true,
            data:verifiedToken
        }
    } catch (error:any) {
        console.log(
          "Error happened during jwt token verification: ",
          error.message,
        );
        return{
            success:false,
            error: error.message
        }
    };

};


export const JwtUtils = {
    CreateJWTToken,
    VerifyJWTToken
};