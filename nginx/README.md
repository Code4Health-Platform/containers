# Nginx Reverse Proxy

Provides a docker container for Nginx.

## Getting Started
These instructions will get you an Nginx service up and running on your local machine for development and testing purposes.

### Modify configuration files
Edit configs as required as Docker COPYs config files from `./conf/` into the container when building the image.

### Build image
- `docker build . -t nginx`

### Run the container
Start an Nginx container
- `docker run --name proxy -d nginx`

Follow the logs
- `docker logs -f proxy`

### Testing with Docker Compose
When running as a service `./conf/` is mounted as `/etc/nginx`
- `docker-compose -f stack.yml up`

## Deploy as Docker stack
When running as a service `./conf/` is mounted as `/etc/nginx`
- `docker stack deploy -c stack.yml test`
