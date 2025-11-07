from fastapi import FastAPI
from fastapi.responses import FileResponse
import uvicorn
import os 

app = FastAPI()

@app.get("/")
def serve_home():
    return FileResponse(os.path.join("app", "static", "index.html"))

@app.get("/api/hello")
def say_hello():
    return {
        "message": "Hello wrold from fastapi"
    }

if __name__ ==  "__main__":
    uvicorn.run(app, host="0.0.0.0", port=4040)


