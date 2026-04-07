# 📝 How to Modify Your Website

## Site Location
All website files are at: `/Users/gauravgoel/copilot/gauravgoel1978.github.io/`

---

## 🗂️ Key Files

| File | What it controls |
|------|-----------------|
| `_config.yml` | Site title, colors, social links, navbar |
| `index.html` | Homepage (hero cards, intro text) |
| `aboutme.md` | About Me page (bio, skills, certs) |
| `experience.md` | Experience timeline |
| `contact.md` | Contact page |
| `_posts/*.md` | Blog posts |
| `assets/css/custom.css` | All visual styling |
| `assets/img/gaurav-avatar.png` | Your profile photo |

---

## 🎨 Change Colors
Edit `_config.yml`:
```yaml
navbar-col: "#0F172A"      # Navbar background (dark navy)
link-col: "#0D9488"        # Links (teal)
hover-col: "#0F766E"       # Hover color
page-col: "#F8FAFC"        # Page background
```

## ✏️ Update Bio / Skills
Edit `aboutme.md` — it's plain Markdown.

## 💼 Add a Work Experience Entry
Edit `experience.md` — copy a `<div class="timeline-item">` block and fill in your details.

## 📸 Add Your Photo
Replace `/assets/img/gaurav-avatar.png` with your photo (200×200 pixels recommended, PNG).

## 📝 Add a Blog Post
Create a new file in `_posts/` named `YYYY-MM-DD-your-title.md`:
```yaml
---
layout: post
title: "Your Post Title"
subtitle: "Optional subtitle"
date: 2025-06-01
tags: [AI, Networking]
---

Your content here in Markdown...
```

## 🔗 Update Social Links
Edit `_config.yml`:
```yaml
social-network-links:
  email: "your@email.com"
  linkedin: "in/your-linkedin-profile"
  github: yourgithubusername
```

---

## 🚀 Push Changes to Live Site
After any change, run:
```bash
cd /Users/gauravgoel/copilot/gauravgoel1978.github.io
git add -A
git commit -m "Update: describe your change"
git push
```
