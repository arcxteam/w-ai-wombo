#!/usr/bin/env bash

# -------------------------------------------------
# Name: node‑bootstrap.sh
# Description: Bootstrap install Node.js, npm, Yarn, and PM2
# Platform: Linux (Ubuntu/Debian)
# -------------------------------------------------

# Install NVM
echo "Installing NVM (Node Version Manager)..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

source ~/.bashrc

# Install Node.js
echo "Installing Node.js v22.18.0 (LTS)..."
nvm install 22.18.0
nvm use 22.18.0
nvm alias default 22.18.0

echo "Verifying Node.js and npm installation..."
node -v
npm -v

# Install PM2
echo "Installing PM2..."
npm install -g pm2

echo "Verifying PM2 installation..."
pm2 -v

# Install Yarn
echo "Installing Yarn..."
npm install -g yarn

echo "Verifying Yarn installation..."
yarn -v

echo "Adding NVM and Node.js to .bash_profile..."

echo "export NVM_DIR=\"$HOME/.nvm\"" >> ~/.bash_profile
echo "[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"" >> ~/.bash_profile
echo "[ -s \"$NVM_DIR/bash_completion\" ] && \. \"$NVM_DIR/bash_completion\"" >> ~/.bash_profile

source ~/.bash_profile

echo "Setting proper permissions for NVM and Node.js installation..."
chown -R $USER:$USER ~/.nvm
chmod -R 755 ~/.nvm

# Ready version help
echo "Installation completed successfully."
echo "Node.js version: $(node -v)"
echo "Npm version: $(npm -v)"
echo "PM2 version: $(pm2 -v)"
echo "Yarn version: $(yarn -v)"
