#!/bin/bash
# ============================================================
# DEPLOY SCRIPT — gauravgoel1978.github.io
# Run this after creating your GitHub Personal Access Token
# ============================================================

echo ""
echo "🚀 Deploying gauravgoel1978.github.io to GitHub Pages"
echo ""

if [ -z "$GITHUB_TOKEN" ]; then
    echo "⚠️  GITHUB_TOKEN not set."
    echo ""
    echo "Steps to get your token:"
    echo "  1. Go to: https://github.com/settings/tokens/new"
    echo "  2. Note: 'Portfolio website deploy'"
    echo "  3. Expiration: 90 days"
    echo "  4. Scopes: check 'repo' (full control)"
    echo "  5. Click 'Generate token' and copy it"
    echo ""
    read -p "Paste your GitHub Personal Access Token here: " GITHUB_TOKEN
fi

echo "→ Creating GitHub repository..."
REPO_RESPONSE=$(curl -s -X POST \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  -d "{\"name\":\"gauravgoel1978.github.io\",\"description\":\"Personal portfolio — Gaurav Goel\",\"homepage\":\"https://gauravgoel1978.github.io\",\"private\":false,\"auto_init\":false}" \
  "https://api.github.com/user/repos")

if echo "$REPO_RESPONSE" | grep -q "already exists"; then
    echo "   Repository already exists — using existing"
elif echo "$REPO_RESPONSE" | grep -q "html_url"; then
    echo "   ✅ Repository created!"
else
    echo "   Response: $REPO_RESPONSE"
fi

echo "→ Setting up git remote..."
git remote remove origin 2>/dev/null
git remote add origin "https://gauravgoel1978:$GITHUB_TOKEN@github.com/gauravgoel1978/gauravgoel1978.github.io.git"

echo "→ Pushing to GitHub..."
git push -u origin main

echo ""
echo "✅ Done! Your site will be live at:"
echo "   https://gauravgoel1978.github.io"
echo ""
echo "   (GitHub Pages takes 1-3 minutes to deploy)"
echo ""
echo "💡 To enable GitHub Pages:"
echo "   1. Go to: https://github.com/gauravgoel1978/gauravgoel1978.github.io/settings/pages"
echo "   2. Source: Deploy from branch → main → / (root)"
echo "   3. Click Save"
