#!/bin/bash
set -e

# Build the Flutter web app
cd apps/frontend
flutter build web

# Remove old public directory in backend
rm -rf ../backend/public

# Copy new build to backend/public
cp -r build/web ../backend/public

echo "Web build copied to apps/backend/public/" 