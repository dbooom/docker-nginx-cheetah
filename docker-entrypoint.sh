#! /bin/bash
set -e

# Check if all required variables defined.
# -----------------------------------------------------------------------------
required_vars=(\
    DWC_NGINX_DOMAIN \
    DWC_NGINX_ROOT \
    DWC_NGINX_PORT \
    DWC_NGINX_PHP_HOST_NAME \
    DWC_NGINX_PHP_HOST_PORT \
)

for var in "${required_vars[@]}" ; do
    if [[ "" == ${!var} ]] ; then
        echo "Error: Required variable $var is not defined."
        exit 1
    fi
done


# Prepare documents root directory.
# -----------------------------------------------------------------------------
if [[ ! -e $DWC_NGINX_ROOT ]] ; then
    echo "Notice: Creating documents root directory..."
    mkdir -p $DWC_NGINX_ROOT
fi


# Start nginx configuration
# -----------------------------------------------------------------------------
mkdir -p /etc/nginx/sites-enabled

cheetah f --env --stdout /etc/nginx/templates/nginx.tmpl > /etc/nginx/nginx.conf
cheetah f --env --stdout /etc/nginx/templates/default.tmpl > /etc/nginx/sites-enabled/default.conf


# Test nginx configuration
# -----------------------------------------------------------------------------
nginx -t


# Start container's main process
# -----------------------------------------------------------------------------
exec nginx -g "daemon off;"
