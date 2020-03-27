#!/bin/bash

set -eo pipefail

if [ -z $GCS_BUCKET ]; then
  echo "Environment variable GCS_BUCKET is required."
  exit 1
fi
if [ -z $GOOGLE_APPLICATION_CREDENTIALS ]; then
  echo "Environment variable GOOGLE_APPLICATION_CREDENTIALS is required."
  exit 1
fi
# Create mount point
gcsfuse --key-file $GOOGLE_APPLICATION_CREDENTIALS $GCS_BUCKET $BACKUP_DIR

exec pg_dump "$@"
