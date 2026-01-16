# Use Node 22 (LTS) on Alpine for a small footprint
FROM node:22-alpine

# Set the working directory
WORKDIR /usr/hardhat

# Copy package files first to leverage Docker layer caching
COPY package.json package-lock.json* ./

# Install dependencies (including the latest Hardhat)
RUN npm install

# Copy the rest of the project files
COPY . .

# Hardhat's local node runs on port 8545
EXPOSE 8545

# Use 0.0.0.0 to ensure the node is accessible outside the container
ENTRYPOINT [ "npx", "hardhat", "node", "--hostname", "0.0.0.0" ]