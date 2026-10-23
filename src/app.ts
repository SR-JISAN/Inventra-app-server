import express,{ type Application, type Request, type Response} from "express"
import cors from "cors"
import statusCode from "http-status-codes"
import config from "./config";



const app:Application = express();

app.use(express.json());

app.use(cors({
    origin:[
        config.app_url,
        config.local_app_url
    ],
    credentials:true
}));


app.get("/", (req: Request, res: Response) => {
  res.send({
    success:true,
    statusCode: statusCode.OK,
    message:"Welcome To Inventa Server",
    data:null
  });
});




export default app;