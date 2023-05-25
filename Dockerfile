# Use base image node 14
# Slim version to make the image smaller
FROM node:14-slim

# Choose the working directory to /app
WORKDIR /app

# Copy all file to working directory
COPY . .

# Set environment variable to Image of NodeJS
ENV NODE_ENV=production DB_HOST=item-db

# Run npm install to install all the depencies
# and then npm build to build application
RUN npm install --production --unsafe-perm && npm run build

# Expose the port to external
EXPOSE 8080

# Execute npm start as docker latest command or entry point of container
ENTRYPOINT ["npm", "start"]
