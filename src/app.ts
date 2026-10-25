import express, {
  type Application,
  type Request,
  type Response,
} from "express";
import cors from "cors";
import statusCode from "http-status-codes";
import config from "./app/config";

const app: Application = express();

app.use(
  cors({
    origin: [config.app_url, config.local_app_url],
    credentials: true,
  }),
);

app.use(express.json());


app.get("/", (req: Request, res: Response) => {
  res.send({
    success: true,
    statusCode: statusCode.OK,
    message: "Welcome To Inventa Server",
    data: null,
  });
});


// auth api

app.use("/api/auth")


export default app;
