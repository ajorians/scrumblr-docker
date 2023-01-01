# scrumblr-docker
Dockerfile and Github Action to create Docker image.

After cloning you can run the following command to create the docker image

docker build -t scrumblr .

Then you can run it via:
docker run -d --name=scrumblr --env SCRUMBLR_REDIS_URL="redis://redishost" --env SCRUMBLR_PORT=80 -p 80:80 --restart unless-stopped scrumblr

