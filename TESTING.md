# Website Testing Guide

This guide explains how to test your website locally before deploying to GitHub Pages.

## 🚀 Quick Start

### Option 1: Simple Python Server (Recommended for beginners)
```bash
# Start a local server
python3 -m http.server 8000

# Or if you have Python 2
python -m SimpleHTTPServer 8000
```

### Option 2: Node.js Server (More features)
```bash
# Install dependencies
npm install

# Start server with auto-open
npm run start-node
```

### Option 3: Use the Testing Scripts
```bash
# Start local development server
./test-local.sh

# Run comprehensive tests
./test-website.sh
```

## 📋 Testing Checklist

### 1. **Local Development Server**
- [ ] Website loads at `http://localhost:8000`
- [ ] All pages and sections are accessible
- [ ] No console errors in browser developer tools

### 2. **Responsive Design Testing**
- [ ] Test on desktop (1920x1080, 1366x768)
- [ ] Test on tablet (768x1024)
- [ ] Test on mobile (375x667, 414x896)
- [ ] Navigation menu works on mobile
- [ ] Text is readable on all screen sizes

### 3. **Functionality Testing**
- [ ] Navigation links work correctly
- [ ] Smooth scrolling to sections
- [ ] Contact form validation works
- [ ] Social media links open in new tabs
- [ ] All buttons and interactive elements respond

### 4. **Content Testing**
- [ ] All placeholder text is replaced with real content
- [ ] Contact information is correct
- [ ] Social media links point to your actual profiles
- [ ] Project links work (if you have real projects)
- [ ] Blog post links work (if you have real posts)

### 5. **Performance Testing**
- [ ] Page loads quickly (< 3 seconds)
- [ ] Images are optimized
- [ ] No large unused files
- [ ] CSS and JS files are minified (optional)

### 6. **Browser Compatibility**
- [ ] Chrome/Chromium
- [ ] Firefox
- [ ] Safari (if on Mac)
- [ ] Edge (if on Windows)

## 🧪 Automated Testing

### Install Testing Tools
```bash
# Install Node.js dependencies
npm install

# This installs:
# - html-validate (HTML validation)
# - stylelint (CSS validation)
# - eslint (JavaScript validation)
# - pa11y (Accessibility testing)
# - lighthouse (Performance testing)
```

### Run All Tests
```bash
# Run basic validation tests
npm test

# Run all tests including performance
npm run test:all

# Run individual tests
npm run test:html      # HTML validation
npm run test:css       # CSS validation
npm run test:js        # JavaScript validation
npm run test:accessibility  # Accessibility testing
npm run test:performance    # Performance testing
```

## 🔧 Manual Testing Steps

### 1. **Start Local Server**
```bash
./test-local.sh
```

### 2. **Open Browser**
- Navigate to `http://localhost:8000`
- Open browser developer tools (F12)

### 3. **Test Navigation**
- Click each navigation link
- Verify smooth scrolling to sections
- Test mobile menu (resize browser window)

### 4. **Test Contact Form**
- Try submitting empty form (should show validation)
- Try invalid email (should show error)
- Try valid submission (should show success message)

### 5. **Test Responsive Design**
- Resize browser window to different sizes
- Use browser dev tools device emulation
- Test on actual mobile device if possible

### 6. **Check Console for Errors**
- Open browser developer tools
- Check Console tab for any JavaScript errors
- Check Network tab for failed requests

## 🐛 Common Issues and Solutions

### Issue: Website doesn't load locally
**Solution:**
- Make sure you're in the correct directory
- Check if port 8000 is already in use
- Try a different port: `python3 -m http.server 8001`

### Issue: CSS/JS not loading
**Solution:**
- Check file paths in HTML
- Ensure files exist in the correct location
- Check browser console for 404 errors

### Issue: Contact form doesn't work
**Solution:**
- This is expected - the form is for display only
- For real functionality, you'd need a backend service
- Consider using services like Formspree or Netlify Forms

### Issue: Images not displaying
**Solution:**
- Check image file paths
- Ensure images are in the correct directory
- Use relative paths: `./images/photo.jpg`

## 📱 Mobile Testing

### Browser Dev Tools
1. Open Chrome/Firefox developer tools
2. Click device emulation icon
3. Select different device sizes
4. Test touch interactions

### Real Device Testing
1. Find your computer's IP address
2. Start server: `python3 -m http.server 8000 --bind 0.0.0.0`
3. Access from mobile: `http://YOUR_IP:8000`

## 🚀 Pre-Deployment Checklist

Before pushing to GitHub:

- [ ] All tests pass
- [ ] Website works on local server
- [ ] No console errors
- [ ] All placeholder content replaced
- [ ] Contact information is correct
- [ ] Social links work
- [ ] Mobile responsive design works
- [ ] Performance is acceptable
- [ ] CNAME file is configured correctly

## 🔄 Deployment Process

```bash
# 1. Test everything locally
./test-website.sh

# 2. Start local server to verify
./test-local.sh

# 3. If everything looks good, deploy
git add .
git commit -m "Update website with personal information"
git push origin main

# 4. Wait 5-10 minutes for GitHub Pages to build
# 5. Visit your live site at www.parlakisik.com
```

## 📞 Getting Help

If you encounter issues:

1. Check the browser console for errors
2. Run the testing scripts to identify problems
3. Verify all file paths are correct
4. Make sure all required files exist
5. Test in different browsers

## 🎯 Performance Tips

- Optimize images (use WebP format when possible)
- Minify CSS and JavaScript files
- Use a CDN for external resources
- Enable gzip compression (handled by GitHub Pages)
- Keep file sizes small

Happy testing! 🎉
