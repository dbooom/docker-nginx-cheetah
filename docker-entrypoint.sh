#! /bin/bash
set -e

# Check if all required variables defined.
# -----------------------------------------------------------------------------
required_vars=(\
    DWC_NGINX_DOMAIN \
    DWC_NGINX_ROOT \
    DWC_NGINX_PORT \
)

for var in "${required_vars[@]}" ; do
    if [[ "" == ${!var} ]] ; then
        echo "Error: Required variable $var is not defined."
        exit 1
    fi
done

# Setup optional variables with default values
# -----------------------------------------------------------------------------
export DWC_NGINX_PHP_HOST_PORT=${DWC_NGINX_PHP_HOST_PORT:=9000}

# Prepare documents root directory.
# -----------------------------------------------------------------------------
if [[ ! -e $DWC_NGINX_ROOT ]] ; then
    echo "Notice: Creating documents root directory..."
    mkdir -p $DWC_NGINX_ROOT
fi


# Generate nginx configuration from templates
# -----------------------------------------------------------------------------
mkdir -p /etc/nginx/sites-enabled

# Base NGINX configuration file
j2 /etc/nginx/templates/nginx.j2 > /etc/nginx/nginx.conf

# Virtual hosts
for file in /etc/nginx/templates/sites-enabled/* ; do
    filename=$(basename "$file")
    output_filename="${filename%.*}.conf"
    j2 "$file" > "/etc/nginx/sites-enabled/$output_filename"
done


# Test nginx configuration
# -----------------------------------------------------------------------------
nginx -t


# Start container's main process
# -----------------------------------------------------------------------------
exec nginx -g "daemon off;"
