#!/bin/bash

# Comprehensive Website Testing Script
# This script runs all tests on your website

echo "🧪 Starting Comprehensive Website Testing..."
echo "==========================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

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

echo -e "${BLUE}📁 Testing website in: $(pwd)${NC}"
echo ""

# 1. Install dependencies if needed
echo -e "${YELLOW}📦 Checking dependencies...${NC}"
if [ -f "package.json" ] && command -v npm >/dev/null 2>&1; then
    if [ ! -d "node_modules" ]; then
        echo -e "${YELLOW}📥 Installing npm dependencies...${NC}"
        npm install --silent
        print_status $? "Dependencies installed"
    else
        print_status 0 "Dependencies already installed"
    fi
else
    echo -e "${YELLOW}⚠️  npm not available, skipping dependency checks${NC}"
fi

echo ""

# 2. HTML Validation
echo -e "${BLUE}🔍 Testing HTML Validation...${NC}"
if command -v npx >/dev/null 2>&1; then
    npx html-validate index.html
    print_status $? "HTML validation completed"
else
    echo -e "${YELLOW}⚠️  html-validate not available. Install with: npm install -g html-validate${NC}"
fi

echo ""

# 3. CSS Validation
echo -e "${BLUE}🎨 Testing CSS Validation...${NC}"
if command -v npx >/dev/null 2>&1; then
    npx stylelint styles.css
    print_status $? "CSS validation completed"
else
    echo -e "${YELLOW}⚠️  stylelint not available. Install with: npm install -g stylelint${NC}"
fi

echo ""

# 4. JavaScript Validation
echo -e "${BLUE}⚡ Testing JavaScript Validation...${NC}"
if command -v npx >/dev/null 2>&1; then
    npx eslint script.js
    print_status $? "JavaScript validation completed"
else
    echo -e "${YELLOW}⚠️  eslint not available. Install with: npm install -g eslint${NC}"
fi

echo ""

# 5. Check for broken links (basic check)
echo -e "${BLUE}🔗 Checking for basic link issues...${NC}"
if [ -f "index.html" ]; then
    # Check for common issues
    if grep -q "href=\"#\"" index.html; then
        echo -e "${YELLOW}⚠️  Found placeholder links (href=\"#\") - update these with real URLs${NC}"
    else
        print_status 0 "No obvious placeholder links found"
    fi
    
    if grep -q "mailto:contact@parlakisik.com" index.html; then
        print_status 0 "Contact email found"
    else
        echo -e "${YELLOW}⚠️  Contact email not found or needs updating${NC}"
    fi
else
    print_status 1 "index.html not found"
fi

echo ""

# 6. File size checks
echo -e "${BLUE}📊 Checking file sizes...${NC}"
if [ -f "styles.css" ]; then
    CSS_SIZE=$(wc -c < styles.css)
    if [ $CSS_SIZE -gt 100000 ]; then
        echo -e "${YELLOW}⚠️  CSS file is large ($CSS_SIZE bytes) - consider optimization${NC}"
    else
        print_status 0 "CSS file size is reasonable ($CSS_SIZE bytes)"
    fi
else
    print_status 1 "styles.css not found"
fi

if [ -f "script.js" ]; then
    JS_SIZE=$(wc -c < script.js)
    if [ $JS_SIZE -gt 50000 ]; then
        echo -e "${YELLOW}⚠️  JavaScript file is large ($JS_SIZE bytes) - consider optimization${NC}"
    else
        print_status 0 "JavaScript file size is reasonable ($JS_SIZE bytes)"
    fi
else
    print_status 1 "script.js not found"
fi

echo ""

# 7. Check for required files
echo -e "${BLUE}📋 Checking required files...${NC}"
REQUIRED_FILES=("index.html" "styles.css" "script.js" "CNAME")
for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$file" ]; then
        print_status 0 "$file exists"
    else
        print_status 1 "$file missing"
    fi
done

echo ""

# 8. Check CNAME file content
echo -e "${BLUE}🌐 Checking CNAME configuration...${NC}"
if [ -f "CNAME" ]; then
    CNAME_CONTENT=$(cat CNAME)
    if [ "$CNAME_CONTENT" = "www.parlakisik.com" ]; then
        print_status 0 "CNAME file correctly configured"
    else
        echo -e "${YELLOW}⚠️  CNAME file content: '$CNAME_CONTENT' - should be 'www.parlakisik.com'${NC}"
    fi
else
    print_status 1 "CNAME file missing"
fi

echo ""

# 9. Summary
echo -e "${BLUE}📋 Testing Summary${NC}"
echo "=================="
echo -e "${GREEN}✅ Basic file structure check completed${NC}"
echo -e "${GREEN}✅ Link validation completed${NC}"
echo -e "${GREEN}✅ File size analysis completed${NC}"
echo ""
echo -e "${YELLOW}💡 Next steps:${NC}"
echo "1. Run './test-local.sh' to start a local server"
echo "2. Open http://localhost:8000 in your browser"
echo "3. Test all functionality manually"
echo "4. Check responsive design on different screen sizes"
echo "5. Test contact form and navigation"
echo ""
echo -e "${BLUE}🚀 Ready to deploy? Run: git add . && git commit -m 'Update website' && git push origin main${NC}"
