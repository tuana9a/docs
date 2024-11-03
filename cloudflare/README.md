# cloudflare

# r2

`.bashrc`

`.zshrc`

```bash
alias r2='aws s3api --endpoint-url "$S3_ENDPOINT_URL"'
```

## List buckets

```bash
r2 list-buckets --query "Buckets[].Name" | jq -r ".[]"
```

## List objects in a bucket

```bash
r2 list-objects-v2 --bucket "$BUCKET_NAME" --query "Contents[].Key" | jq -r ".[]"
```

## List objects in a bucket with size

```bash
r2 list-objects-v2 --bucket "$BUCKET_NAME" --query "Contents[].{Key:Key,Size:Size}" | jq -r ".[] | [.Key,.Size] | @tsv"
```

## Search objects in a bucket by prefix

```bash
r2 list-objects-v2 --bucket "$BUCKET_NAME" --prefix $OBJECT_PREFIX --query "Contents[].Key" | jq -r ".[]"
```

## Search objects in a bucket by prefix with size

```bash
r2 list-objects-v2 --bucket "$BUCKET_NAME" --prefix $OBJECT_PREFIX --query "Contents[].{Key:Key,Size:Size}" | jq -r ".[] | [.Key,.Size] | @tsv"
```

## Get object

```bash
r2 get-object --bucket "$BUCKET_NAME" --key $OBJECT_KEY $FILEPATH
```

## Upload object

```bash
r2 put-object --bucket "$BUCKET_NAME" --key $OBJECT_KEY --body $FILEPATH
```

## Delete object

```bash
r2 delete-object --bucket "$BUCKET_NAME" --key $OBJECT_KEY
```
