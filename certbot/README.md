# Certbot

docker run -p 80:80 -v letencrypt-etc:/etc/letsencrypt -it certbot/certbot certonly --standalone -d www.example.org -m email@example.io --agree-tos -n --test-cert
