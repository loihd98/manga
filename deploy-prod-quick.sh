#!/bin/bash

echo "🚀 QUICK PRODUCTION DEPLOYMENT"
echo "==============================="

echo "📋 1. Checking environment..."
if [ ! -f ".env.prod" ]; then
    echo "❌ .env.prod not found!"
    echo "Please create .env.prod with production configuration"
    exit 1
fi

echo "✅ Environment file found"

echo ""
echo "🛑 2. Stopping existing containers..."
docker compose -f docker-compose.prod.yml down

echo ""
echo "🔨 3. Building images..."
docker compose -f docker-compose.prod.yml build --no-cache

echo ""
echo "🚀 4. Starting services..."
echo "📊 Starting PostgreSQL..."
docker compose -f docker-compose.prod.yml up -d postgres

echo "⏳ Waiting for PostgreSQL..."
sleep 10

echo "⚙️ Starting Backend..."
docker compose -f docker-compose.prod.yml up -d backend

echo "⏳ Waiting for Backend..."
sleep 15

echo "🌐 Starting Frontend..."
docker compose -f docker-compose.prod.yml up -d frontend

echo "⏳ Waiting for Frontend..."
sleep 10

echo "🔀 Starting Nginx..."
docker compose -f docker-compose.prod.yml up -d nginx

echo ""
echo "📋 5. Checking containers..."
docker compose -f docker-compose.prod.yml ps

echo ""
echo "🧪 6. Testing services..."
echo "⚙️ Testing Backend health..."
for i in {1..5}; do
    if curl -f http://localhost/api/health > /dev/null 2>&1; then
        echo "✅ Backend OK"
        break
    fi
    echo "⏳ Attempt $i/5..."
    sleep 5
done

echo ""
echo "🔐 7. SSL Certificate Setup Instructions:"
echo "========================================="
echo "After verifying HTTP works, run:"
echo ""
echo "docker compose -f docker-compose.prod.yml run --rm certbot certonly \\"
echo "  --webroot --webroot-path=/var/www/certbot \\"
echo "  -d vivutruyenhay.com -d www.vivutruyenhay.com \\"
echo "  --email hideonstorms@gmail.com --agree-tos --no-eff-email"
echo ""
echo "Then restart nginx:"
echo "docker compose -f docker-compose.prod.yml restart nginx"

echo ""
echo "✅ DEPLOYMENT COMPLETED!"
echo "======================="
echo "🌐 HTTP: http://vivutruyenhay.com"
echo "🌐 HTTP: http://103.199.18.123"
echo "📊 Monitor: docker compose -f docker-compose.prod.yml logs -f"
echo ""
echo "Next steps:"
echo "1. Test HTTP access"
echo "2. Setup SSL certificates"
echo "3. Test HTTPS access"