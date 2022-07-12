# create CA key
openssl genrsa -out rootCA.key 4096

# create CA cert
openssl req -new -subj "/C=VN/ST=HN/O=TechPro/CN=TechPro" -x509 -sha256 -days 365 -key rootCA.key -out rootCA.crt

# create server key
openssl genrsa -out server.key 4096

# create signing request
openssl req -new -sha256 -subj "/CN=TechPro AI" -key server.key -out server.csr

# section 1
echo "subjectAltName=DNS.1:techpro.local,DNS.2:*.techpro.local" > extfile.cnf
openssl x509 -req -sha256 -days 365 -in server.csr -CA rootCA.crt -CAkey rootCA.key -out server.crt -extfile extfile.cnf -CAcreateserial
# or
openssl x509 -req -sha256 -days 365 -in server.csr -CA rootCA.crt -CAkey rootCA.key -out server.crt -extfile <(printf "subjectAltName=IP.1:172.19.0.11,IP.2:172.19.0.12,IP.3:172.19.0.13") -CAcreateserial
# end section 1

# optional if required
cat server.crt rootCA.crt > fullchain.crt

# update CA for local machine
# @ubuntu
sudo rm /usr/local/share/ca-certificates/ca.crt
sudo update-ca-certificates -f

sudo cp rootCA.crt /usr/local/share/ca-certificates/ca.crt
sudo update-ca-certificates
