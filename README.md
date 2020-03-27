# PostgreSQL client with GCS support
A Docker image with a PostgreSQL client and Google Cloud Fuse to support Google Cloud Storage (GCS). This images makes it very
easy to create database dumps and transfer them to GCS or to recover a database from GCS.

## Instructions

You need to make sure that you have the Google Application credentials available in a JSON file. This file must be mounted
somewhere in the container. In the following example the JSON file with credentials resides in the working directory.

**usage:**
    
    docker run --privileged --rm -v $(pwd):/gcs -e GOOGLE_APPLICATION_CREDENTIALS=/gcs/credentials.json -e GCS_BUCKET=my-bucket postgresql-client-fuse:latest

when the GCS bucket was mounted successfully, you will see the *help* output of the `pg_dump` command.

### Creating a backup
*TODO*
