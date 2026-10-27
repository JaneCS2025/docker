'''
docker version
docker run hello-world

If you see “Hello from Docker!”, you're ready. Read the message it prints: it explains what just happened (pulled an image, created a container, ran it).

An image is a read-only template, like a class. A container is a running instance of an image, like an object; you can run many containers from one image. A registry (Docker Hub) is where images are stored and pulled from. Also remember that containers share the host’s kernel, which is why they start in seconds, unlike virtual machines.

docker run -d -p 8080:80 --name web nginx   # run in background, map port 8080 → 80
docker ps                                   # list running containers
docker logs web                             # see output
docker exec -it web bash                    # open a shell inside the container
docker stop web && docker rm web            # stop and delete
docker images                               # list images

'''

'''
docker build -t myapp .
docker run -d -p 8000:8000 --name myapp myapp
docker rm -f myapp .
#                                 container image

docker run -d -p 8000:8000 --name myapp-container myapp-image
'''

'''
docker stop myapp-container
docker start myapp-container
docker logs myapp-container
'''