openssl genrsa -out "./ssl/default.key" 2048
openssl req -new -key "./ssl/default.key" -out "./ssl/default.csr" -subj "/CN=default/O=default/C=UK"
openssl x509 -req -days 365 -in "./ssl/default.csr" -signkey "./ssl/default.key" -out "./ssl/default.crt"
chmod 644 ./ssl/default.key
