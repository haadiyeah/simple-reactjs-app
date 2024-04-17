# Use an official Node.js runtime as the base image
FROM node:14

# Set the working directory in the container to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install any needed packages specified in package.json
RUN npm install

# Bundle the app source inside the Docker image 
# (assuming your app source code is in the "src" directory of your project)
COPY . .

# Make port 80 available to the world outside this container
EXPOSE 80

# Define the command to run your app using CMD which defines your runtime
# Here we use "npm start" to start your Node.js app
CMD [ "npm", "start" ]