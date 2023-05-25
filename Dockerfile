# Use base image node 14
# Slim version to make the image smaller
FROM node:14-slim

# Choose the working directory to app
WORKDIR /app

# Copy all file to working directory
COPY . .

# Set environment variable
ENV NODE_ENV=production DB_HOST=item-db

# Run npm install production and then npm build
RUN npm install --production --unsafe-perm && npm run build

# Expose the port to external
EXPOSE 8080

# Execute npm start as docker latest command
ENTRYPOINT ["npm", "start"]
