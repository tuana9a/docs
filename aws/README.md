# aws

# sts + iam role

```bash
roleArn=

export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" $(aws sts assume-role --role-arn $roleArn --role-session-name test@tuana9a.com --query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" --output text))

aws sts get-caller-identity

PAGER="" aws sts get-caller-identity

unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY
```