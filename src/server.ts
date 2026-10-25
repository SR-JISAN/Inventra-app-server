import app from "./app";
import config from "./app/config";

const port = config.port;
function main() {
  try {
    app.listen(port, () => {
      console.log(`Inventa App server Running on port ${port}`);
    });
  } catch (error) {
    console.log(`Error starting the server: ${error}`);
    process.exit(1);
  }
}

main();
