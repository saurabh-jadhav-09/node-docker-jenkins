# Use official Node.js image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy project files
COPY . .

# Expose application port
EXPOSE 3000

# Command to run application
CMD ["node", "index.js"]

