# Info

Thanks **[Bui Manh Truong](https://github.com/mtb-hust)** and **[TechPro.vn](https://techpro.vn)** for give me chance to work as a DevOps when I'm still a college student of HUST

# Steps to create your SSL with your own CA (Self Sign Certificate)

## 1. create ca key

```bash
openssl genrsa -out rootCA.key 4096
```

## 2. create ca cert

```bash
openssl req -new \
-subj "/C=VN/ST=HN/O=TechPro/CN=TechPro" -x509 -sha256 \
-days 365 \
-key rootCA.key \
-out rootCA.crt
```

## 3. create server key

```bash
openssl genrsa -out server.key 4096
```

## 4. create cert request

```bash
openssl req -new -sha256 \
-subj "/CN=TechPro AI" \
-key server.key \
-out server.csr
```

## 5. create cert

```bash
echo "subjectAltName=DNS.1:techpro-ai.local,DNS.2:*.techpro-ai.local" > extfile.cnf

openssl x509 -req -sha256 \
-days 365 \
-in server.csr \
-CA rootCA.crt \
-CAkey rootCA.key \
-out server.crt \
-extfile extfile.cnf -CAcreateserial

# or

openssl x509 -req -sha256 \
-days 365 \
-in server.csr \
-CA rootCA.crt \
-CAkey rootCA.key \
-out server.crt \
-extfile <(printf "subjectAltName=IP.1:172.19.0.11,IP.2:172.19.0.12,IP.3:172.19.0.13") -CAcreateserial
```

## 6. (optional) create full chain cert

```bash
cat server.crt rootCA.crt > fullchain.crt
```

## 7. (optional) import CA to your operating system

```bash
# remove old CA (if has)
sudo rm /usr/local/share/ca-certificates/ca.crt
sudo update-ca-certificates -f

# copy new ca to destination
sudo cp rootCA.crt /usr/local/share/ca-certificates/ca.crt
sudo update-ca-certificates
```

# Bonus

On Windows some browers like: Google Chrome, Firefox, ... automaticaly accept imported CA from os (windows)

But in Linux or other distro may be you need to import CA directly in the browser manually

So after import your CA to you operating system. You may also need to do that again with your browser

## Chrome (Jun 29, 2022)

- open Chrome Settings, then search for `certificates` then click click `Security`

  ![](./img/Screenshot%20from%202022-06-29%2020-25-43.png)

- next choose `Manage certificates`

  ![](./img/Screenshot%20from%202022-06-29%2020-28-22.png)

  choose tab `Authorities` then click `Import`

  ![](./img/Screenshot%20from%202022-06-29%2020-30-24.png)

- browse the `rootCA.crt` as generated above, then the browser will ask

  check as image below

  ![](./img/Screenshot%20from%202022-06-29%2020-34-23.png)

- result

  ![](./img/Screenshot%20from%202022-06-29%2020-37-30.png)

## Firefox

same as chrome: do your research 👽

# Refs

[Self Signed Certificate with Custom Root CA](https://gist.github.com/fntlnz/cf14feb5a46b2eda428e000157447309)

[How to create a valid self signed SSL Certificate?](https://www.youtube.com/watch?v=VH4gXcvkmOY)

[https://github.com/xcad2k/cheat-sheets/blob/main/misc/ssl-certs.md](https://github.com/xcad2k/cheat-sheets/blob/main/misc/ssl-certs.md)
