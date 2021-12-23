echo simple password:
date +%s | sha256sum | base64 | head -c 15 ; echo
echo openssl password:
openssl rand -base64 15