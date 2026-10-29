from fastapi import FastAPI
import os, redis
import socket

r = redis.Redis(host=os.getenv("REDIS_HOST", "redis"), port=6379)

app = FastAPI()

@app.get("/")
def hello():
    return {"message": "Hello from Docker test 2", "pod": socket.gethostname()}

@app.get("/count")
def count():
    return {"visits": r.incr("visits")}