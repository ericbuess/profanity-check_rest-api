docker stop rest
#docker stop $(docker ps -aq)
docker system prune -f
docker rmi -f $(docker images -a -q)
#docker build -t rest /home/eric/git/rest/
#docker build -t rest .
#docker run -d -p 8080:8080 --mount source=git-rest,destination=/app --name rest rest
#docker run -d -p 8080:8080 --name rest rest
#docker run -d -p 8080:8080 --volume=/home/eric/git/rest --name rest rest
#docker run -p 8080:8080 -v /home/eric/git/rest:/app:ro --name rest rest
#docker run -d -p 8080:8080 -v /home/eric/git/rest:/app:ro --name rest rest
#docker logs rest
