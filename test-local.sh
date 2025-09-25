#!/bin/bash

# Local Testing Script for Parlak Isik Website
# This script helps you test your website locally before deploying

echo "🚀 Starting Local Website Testing..."
echo "=================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to print status
print_status() {
    if [ $1 -eq 0 ]; then
        echo -e "${GREEN}✅ $2${NC}"
    else
        echo -e "${RED}❌ $2${NC}"
    fi
}

# Check if we're in the right directory
if [ ! -f "index.html" ]; then
    echo -e "${RED}❌ Error: index.html not found. Please run this script from the website root directory.${NC}"
    exit 1
fi

echo -e "${BLUE}📁 Current directory: $(pwd)${NC}"
echo ""

# 1. Check if Python is available for local server
echo -e "${YELLOW}🔍 Checking for Python...${NC}"
if command_exists python3; then
    print_status 0 "Python 3 is available"
    PYTHON_CMD="python3"
elif command_exists python; then
    print_status 0 "Python is available"
    PYTHON_CMD="python"
else
    print_status 1 "Python not found. Please install Python to run local server."
    echo -e "${YELLOW}💡 Alternative: Install Node.js and run 'npm install && npm start'${NC}"
fi

# 2. Check if Node.js is available
echo -e "${YELLOW}🔍 Checking for Node.js...${NC}"
if command_exists node; then
    print_status 0 "Node.js is available (version: $(node --version))"
    NODE_AVAILABLE=true
else
    print_status 1 "Node.js not found"
    NODE_AVAILABLE=false
fi

# 3. Check if npm is available
echo -e "${YELLOW}🔍 Checking for npm...${NC}"
if command_exists npm; then
    print_status 0 "npm is available (version: $(npm --version))"
    NPM_AVAILABLE=true
else
    print_status 1 "npm not found"
    NPM_AVAILABLE=false
fi

echo ""
echo -e "${BLUE}🌐 Starting Local Development Server...${NC}"

# Start local server
if [ "$NODE_AVAILABLE" = true ] && [ "$NPM_AVAILABLE" = true ]; then
    echo -e "${YELLOW}📦 Installing dependencies...${NC}"
    npm install --silent
    if [ $? -eq 0 ]; then
        print_status 0 "Dependencies installed successfully"
        echo -e "${GREEN}🚀 Starting server with Node.js...${NC}"
        echo -e "${BLUE}📍 Your website will be available at: http://localhost:8000${NC}"
        echo -e "${YELLOW}💡 Press Ctrl+C to stop the server${NC}"
        echo ""
        npm run start-node
    else
        print_status 1 "Failed to install dependencies"
        echo -e "${YELLOW}🔄 Falling back to Python server...${NC}"
        if [ ! -z "$PYTHON_CMD" ]; then
            echo -e "${GREEN}🚀 Starting server with Python...${NC}"
            echo -e "${BLUE}📍 Your website will be available at: http://localhost:8000${NC}"
            echo -e "${YELLOW}💡 Press Ctrl+C to stop the server${NC}"
            echo ""
            $PYTHON_CMD -m http.server 8000
        fi
    fi
elif [ ! -z "$PYTHON_CMD" ]; then
    echo -e "${GREEN}🚀 Starting server with Python...${NC}"
    echo -e "${BLUE}📍 Your website will be available at: http://localhost:8000${NC}"
    echo -e "${YELLOW}💡 Press Ctrl+C to stop the server${NC}"
    echo ""
    $PYTHON_CMD -m http.server 8000
else
    echo -e "${RED}❌ No server available. Please install Python or Node.js${NC}"
    exit 1
fi
