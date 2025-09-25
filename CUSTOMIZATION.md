# Website Customization Guide

## How to Add Your LinkedIn Background Information

To personalize this website with your actual professional background from LinkedIn, follow these steps:

### 1. Extract Information from Your LinkedIn Profile

Visit your LinkedIn profile at https://www.linkedin.com/in/parlakisik/ and gather:

- **Current Job Title & Company**
- **Professional Summary/About section**
- **Work Experience** (companies, roles, dates, key achievements)
- **Education** (degrees, institutions, dates)
- **Skills** (technical and soft skills)
- **Certifications**
- **Languages**
- **Projects** (if any are listed)

### 2. Update the About Section

Edit the `index.html` file and replace the content in the About section (around line 84-103):

```html
<div class="about-text">
    <p>
        [Replace with your actual professional summary from LinkedIn]
    </p>
    <p>
        [Add more details about your background, experience, and achievements]
    </p>
    <div class="experience-highlights">
        <h3>Professional Highlights</h3>
        <ul>
            <li>[Your actual years of experience]</li>
            <li>[Your key expertise areas]</li>
            <li>[Notable achievements or projects]</li>
            <li>[Leadership or mentoring experience]</li>
            <li>[Any awards or recognitions]</li>
        </ul>
    </div>
</div>
```

### 3. Update Technical Skills

In the same file, update the skills section (around line 104-130) with your actual skills:

```html
<div class="skill-category">
    <h4>Programming Languages</h4>
    <div class="skill-tags">
        <span class="skill-tag">[Your actual languages]</span>
        <!-- Add more as needed -->
    </div>
</div>
```

### 4. Update Projects Section

Replace the placeholder projects (around line 140-200) with your actual projects:

```html
<div class="project-card">
    <div class="project-image">
        <i class="fas fa-code"></i>
    </div>
    <div class="project-content">
        <h3>[Your Project Name]</h3>
        <p>[Project description from LinkedIn or your portfolio]</p>
        <div class="project-tech">
            <span class="tech-tag">[Technologies used]</span>
        </div>
        <div class="project-links">
            <a href="[GitHub link]" class="project-link">
                <i class="fab fa-github"></i> Code
            </a>
            <a href="[Live demo link]" class="project-link">
                <i class="fas fa-external-link-alt"></i> Live Demo
            </a>
        </div>
    </div>
</div>
```

### 5. Update Contact Information

Update the contact section (around line 250) with your actual contact details:

```html
<div class="contact-method">
    <i class="fas fa-envelope"></i>
    <div>
        <h4>Email</h4>
        <p>[your-actual-email@domain.com]</p>
    </div>
</div>
```

### 6. Update Social Links

Make sure all social media links point to your actual profiles:

- LinkedIn: https://www.linkedin.com/in/parlakisik/
- GitHub: [Your GitHub profile URL]
- Email: [Your actual email address]

### 7. Add Your Photo (Optional)

To add your professional photo:

1. Add your photo to the project folder (e.g., `profile.jpg`)
2. Replace the Font Awesome icon in the profile section with:
```html
<img src="profile.jpg" alt="Parlak Isik" class="profile-photo">
```
3. Add CSS styling for the photo in `styles.css`:
```css
.profile-photo {
    width: 150px;
    height: 150px;
    border-radius: 50%;
    object-fit: cover;
    border: 4px solid #fbbf24;
}
```

### 8. Test Your Changes

After making updates:

1. Open `index.html` in your browser to preview changes
2. Test on different screen sizes (mobile, tablet, desktop)
3. Check all links work correctly
4. Verify contact form functionality

### 9. Deploy Updates

Once you're satisfied with the changes:

```bash
git add .
git commit -m "Update website with personal information"
git push origin main
```

Your website will automatically update on GitHub Pages!

## Quick Tips

- Keep descriptions concise but informative
- Use action verbs in your experience highlights
- Include quantifiable achievements when possible
- Make sure all external links work
- Test the mobile responsiveness
- Keep the design professional and clean

## Need Help?

If you need assistance customizing specific sections, feel free to ask for help with particular areas of the website.
