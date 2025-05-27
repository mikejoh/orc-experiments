#!/usr/bin/env bash

set -euo pipefail

OPENRC_FILE="${1:-~/Downloads/demo-openrc.sh}"

if [ ! -f "$OPENRC_FILE" ]; then
    echo "Error: File $OPENRC_FILE does not exist."
    exit 1
fi

if [ ! -r "$OPENRC_FILE" ]; then
    echo "Error: File $OPENRC_FILE is not readable."
    exit 1
fi

# Source the OpenRC file to set environment variables
source "$OPENRC_FILE"

cat <<EOF >clouds.yaml
clouds:
  openstack:
    auth:
      auth_url: $OS_AUTH_URL
      username: "$OS_USERNAME"
      password: "$OS_PASSWORD"
      project_name: "$OS_PROJECT_NAME"
      project_id: "$OS_PROJECT_ID"
      user_domain_name: "$OS_USER_DOMAIN_NAME"
    region_name: "$OS_REGION_NAME"
    interface: "public"
    identity_api_version: $OS_IDENTITY_API_VERSION
EOF
