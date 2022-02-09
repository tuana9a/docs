FROM node:12-alpine

# create group and user
RUN groupadd -r tuana9a && useradd -g tuana9a tuana9a

# set ownership and permission
RUN chown -R tuana9a:tuana9a /app

# switch user
USER tuana9a

# run
CMD node index.js