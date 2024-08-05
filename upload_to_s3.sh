#!/bin/bash

# Function to print usage
usage() {
  echo "Usage: $0 <file_path> <bucket_name>"
  exit 1
}

# Check if the correct number of arguments is provided
if [ $# -ne 2 ]; then
  usage
fi

FILE_PATH=$1
BUCKET_NAME=$2

# Check if the file exists
if [ ! -f "$FILE_PATH" ]; then
  echo "File not found!"
  exit 1
fi

# Upload the file to S3
aws s3 cp "$FILE_PATH" "s3://$BUCKET_NAME/"

# Check if the upload was successful
if [ $? -eq 0 ]; then
  echo "File successfully uploaded to $BUCKET_NAME"
else
  echo "File upload failed"
  exit 1
fi
