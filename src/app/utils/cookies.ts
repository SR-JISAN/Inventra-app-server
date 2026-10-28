import { CookieOptions } from "express";
import config from "../config";


const baseCookieOptions : CookieOptions = {
   httpOnly:true,
   secure: config.node_env === "production",
   sameSite : config.node_env === "production" ? "none" : "lax",
   path:"/"
}

export const accessToken:CookieOptions  = {
    ...baseCookieOptions,
    maxAge : 1000 * 60*60*24
};


export const refreshToken = {
    ...baseCookieOptions,
    maxAge : 1000* 60* 60* 24* 7
};

