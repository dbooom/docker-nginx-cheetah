# Generate NGINX configuration from templates - Docker image

Create NGINX configuration with Jinja2 templates and environment variables.

This image is meant to be used as a part of specific Docker Compose project.
For more information about how to run this image go to the [project repo](https://github.com/dbooom/docker-compose-wp).

Based on the [official nginx:alpine docker image](https://hub.docker.com/_/nginx/)

## Environment variables

### Required variables:
| Variable Name             | Description         |
| ---                       | ---                 |
| `DWC_NGINX_DOMAIN`        | Domain name of NGINX virtual host |
| `DWC_NGINX_PORT`          | Port number of NGINX virtual host |
| `DWC_NGINX_ROOT`          | Documents root directory path |

### Optional variables:
| Variable Name               | Description         | Default value            |
| ---                         | ---                 | ---                      |
| `DWC_NGINX_PHP_HOST_PORT` | Port number of PHP-FPM process from PHP container | `9000` |
