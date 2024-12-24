# Table of Contents

- [Table of Contents](#table-of-contents)
- [who am i](#who-am-i)
- [aws sts assume-role](#aws-sts-assume-role)

# who am i

```bash
aws sts get-caller-identity
```

# aws sts assume-role

set role arn

```bash
roleArn=
```

assume role and set aws credential env variables

```bash
export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" $(aws sts assume-role --role-arn $roleArn --role-session-name "$(whoami)@$(hostname)" --query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" --output text))
```

```bash
aws sts get-caller-identity
```

"logout"

```bash
unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY
```