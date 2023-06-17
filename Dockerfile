# Base node alphine image
FROM node:10.23.3-alpine

# Install bash to execute bash later
RUN apk add --no-cache bash

# Download wait-for-it script for waiting rabbitmq to up
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

# Add permission to execute for fil wait-for-it.sh
RUN chmod +x /bin/wait-for-it.sh

# Set workdir to src
WORKDIR /src

# Copy package json to workdir
COPY package*.json ./

# Copy file with js extension to  workdir
COPY ./*.js ./
 
#  Running npm install
RUN npm install
CMD ["node", "index.js"]
