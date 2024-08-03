#!/bin/bash

# List buckets
list_buckets() {
    aws s3api --endpoint-url "$S3_ENDPOINT_URL" list-buckets --query "Buckets[].Name" | jq -r ".[]"
}

# List objects in a bucket
list_objects() {
    aws s3api --endpoint-url "$S3_ENDPOINT_URL" list-objects-v2 --bucket "$BUCKET_NAME" --query "Contents[].Key" | jq -r ".[]"
}

# List objects in a bucket with size
list_objects_with_size() {
    aws s3api --endpoint-url "$S3_ENDPOINT_URL" list-objects-v2 --bucket "$BUCKET_NAME" --query "Contents[].{Key:Key,Size:Size}" | jq -r ".[] | [.Key,.Size] | @tsv"
}

# Search objects in a bucket by prefix
search_objects() {
    aws s3api --endpoint-url "$S3_ENDPOINT_URL" list-objects-v2 --bucket "$BUCKET_NAME" --prefix $1 --query "Contents[].Key" | jq -r ".[]"
}

# Search objects in a bucket by prefix with size
search_objects_with_size() {
    aws s3api --endpoint-url "$S3_ENDPOINT_URL" list-objects-v2 --bucket "$BUCKET_NAME" --prefix $1 --query "Contents[].{Key:Key,Size:Size}" | jq -r ".[] | [.Key,.Size] | @tsv"
}

# Get object
get_object() {
    aws s3api --endpoint-url "$S3_ENDPOINT_URL" get-object --bucket "$BUCKET_NAME" --key $1 $2
}

# Upload object
put_object() {
    aws s3api --endpoint-url "$S3_ENDPOINT_URL" put-object --bucket "$BUCKET_NAME" --key $1 --body $2
}

# Delete object
delete_object() {
    aws s3api --endpoint-url "$S3_ENDPOINT_URL" delete-object --bucket "$BUCKET_NAME" --key $1
}

case "$1" in
    "list-buckets")
        list_buckets
        ;;
    "list-objects")
        list_objects
        ;;
    "search-objects")
        search_objects $2
        ;;
    "get-object")
        object_key=$2
        filepath=$3
        if [ -z $filepath ]; then
            filepath=$object_key;
        fi
        get_object $object_key $filepath
        ;;
    "put-object")
        object_key=$2
        filepath=$3
        if [ -z $filepath ]; then
            filepath=$object_key;
        fi
        put_object $object_key $filepath
        ;;
    "delete-object")
        object_key=$2
        delete_object $object_key
        ;;
    *)
        echo "Invalid command"
        exit 1
        ;;
esac
