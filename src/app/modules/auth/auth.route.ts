import {  IRouter, Router } from "express";



const router = Router();


router.use("/login")


export const AuthRouter: IRouter = router;