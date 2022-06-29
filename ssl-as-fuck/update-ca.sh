sudo rm /usr/local/share/ca-certificates/ca.crt
sudo update-ca-certificates -f

sudo cp rootCA.crt /usr/local/share/ca-certificates/ca.crt
sudo update-ca-certificates
