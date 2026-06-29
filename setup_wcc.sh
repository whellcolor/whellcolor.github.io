#!/bin/bash

# ====================================================================
# WCC (Whellcolor Cube Crypto) Automated Setup Script
# Author: Muhammad Nur Firdaus
# ====================================================================

echo "=================================================="
echo " Starting Setup for Whellcolor Cube Crypto (WCC) "
echo "=================================================="

# 1. Membuat file ads.txt dan app-ads.txt
echo "Creating monetization files..."
echo "google.com, pub-7182145371991939, DIRECT, f08c47fec0942fa0" > ads.txt
echo "google.com, pub-7182145371991939, DIRECT, f08c47fec0942fa0" > app-ads.txt

# 2. Membuat file JSON (profile.json)
echo "Creating profile.json..."
cat << 'EOF' > profile.json
{
  "ad_network": {
    "domain": "google.com",
    "publisher_id": "pub-7182145371991939",
    "relationship": "DIRECT",
    "certification_authority_id": "f08c47fec0942fa0"
  },
  "app_info": {
    "name": "Whellcolor Cube Crypto (WCC)",
    "url": "https://whellcolor.github.io/"
  },
  "payments_profile": {
    "id": "6655-4811-6219",
    "account_type": "Individual",
    "owner": "Muhammad Nur Firdaus"
  }
}
EOF

# 3. Membuat file YAML (profile.yml)
echo "Creating profile.yml..."
cat << 'EOF' > profile.yml
ad_network:
  domain: "google.com"
  publisher_id: "pub-7182145371991939"
  relationship: "DIRECT"
  certification_authority_id: "f08c47fec0942fa0"

app_info:
  name: "Whellcolor Cube Crypto (WCC)"
  url: "https://whellcolor.github.io/"
EOF

# 4. Membuat file package.json
echo "Creating package.json..."
cat << 'EOF' > package.json
{
  "name": "whellcolor-cube-crypto",
  "version": "1.0.0",
  "description": "Whellcolor Cube Crypto (WCC) platform.",
  "main": "index.js",
  "homepage": "https://whellcolor.github.io",
  "author": "Muhammad Nur Firdaus",
  "license": "ISC"
}
EOF

# 5. Membuat file source code multi-bahasa
echo "Creating source code files (C, Python, TS, PHP, R)..."

# File C
cat << 'EOF' > wcc_profile.c
#include <stdio.h>
int main() {
    printf("Whellcolor Cube Crypto (WCC) Initialization\n");
    return 0;
}
EOF

# File Python
cat << 'EOF' > wcc_profile.py
print("Whellcolor Cube Crypto (WCC) Python Config Loaded.")
EOF

# File TypeScript
cat << 'EOF' > wcc_profile.ts
const appName: string = "Whellcolor Cube Crypto (WCC)";
console.log(`${appName} TS Config Loaded.`);
EOF

# File PHP
cat << 'EOF' > wcc_profile.php
<?php
echo "Whellcolor Cube Crypto (WCC) PHP Backend.";
?>
EOF

# File R
cat << 'EOF' > wcc_profile.R
print("Whellcolor Cube Crypto (WCC) R Analytics Loaded.")
EOF

# 6. Proses Git Automation (Add, Commit, Push)
echo "--------------------------------------------------"
echo "Processing Git & GitHub Deployment..."
echo "--------------------------------------------------"

# Menambahkan semua file baru
git add ads.txt app-ads.txt profile.json profile.yml package.json wcc_profile.c wcc_profile.py wcc_profile.ts wcc_profile.php wcc_profile.R setup_wcc.sh

# Commit perubahan
git commit -m "Automated update: Added full WCC configuration files & scripts"

# Mendeteksi nama branch aktif (main atau master) secara otomatis
BRANCH=$(git branch --show-current)

# Push ke GitHub
echo "Pushing changes to GitHub branch: $BRANCH..."
git push origin "$BRANCH"

echo "=================================================="
echo " All WCC files created and pushed successfully! "
echo "=================================================="
