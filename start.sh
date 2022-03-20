docker run -p 127.0.0.1:4000:4000 \
-v "$(pwd):/app" \
--env-file .env \
tuana9a/docs:1.0.0