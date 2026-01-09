#!/bin/bash

echo "🍔 Setting up Moa Burgers for PM2..."

# 1. Install dependencies
echo "📦 Installing dependencies..."
npm install

# 2. Build the project
echo "🛠️ Building the project..."
npm run build

# 3. Check for PM2
if ! command -v pm2 &> /dev/null
then
    echo "⬇️ PM2 not found. Installing globally..."
    npm install -g pm2
else
    echo "✅ PM2 is already installed."
fi

# 4. Start the application
echo "🚀 Starting application..."
pm2 start ecosystem.config.cjs

# 5. Save the list
echo "💾 Saving PM2 process list..."
pm2 save

echo "---------------------------------------------------"
echo "✅ Setup complete! To enable auto-start on reboot:"
echo "   Run: pm2 startup"
echo "   Copy the output command and run it."
echo "   Then run: pm2 save"
echo "---------------------------------------------------"
