SSL_NAME=server

openssl genrsa -out $SSL_NAME.key 4096

openssl req -new -sha256 -subj "/CN=Tech Pro AI" -key $SSL_NAME.key -out $SSL_NAME.csr

echo "subjectAltName=DNS.1:techpro.local,DNS.2:*.techpro.local" > extfile.cnf

openssl x509 -req -sha256 -days 365 -in $SSL_NAME.csr -CA rootCA.crt -CAkey rootCA.key -out $SSL_NAME.crt -extfile extfile.cnf -CAcreateserial

cat $SSL_NAME.crt rootCA.crt > fullchain.crt

