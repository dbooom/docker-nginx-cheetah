# NGINX configuration from templates - Docker image

Create NGINX configuration with Cheetah templates and environment variables.

This image is meant to be used as a part of a specific Docker Compose project.
For more information about how to run this image go to the [project repo](https://github.com/dbooom/docker-compose-wp).

Based on the [official nginx:latest docker image](https://hub.docker.com/_/nginx/)

## Environment variables
| Variable Name             | Description         |
| ---                       | ---                 |
| `DWC_NGINX_DOMAIN`        | Domain name of NGINX virtual host |
| `DWC_NGINX_PORT`          | Port number of NGINX virtual host |
| `DWC_NGINX_ROOT`          | Documents root directory path |
| `DWC_NGINX_PHP_HOST_NAME` | Name of the container name wich runs PHP-FPM process |
| `DWC_NGINX_PHP_HOST_PORT` | Port number of PHP-FPM process from PHP container |
