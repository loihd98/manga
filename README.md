# 📚 vivutruyenhay.com - Modern Story Reading Platform

A comprehensive web application for reading stories and novels online with advanced features and professional UI/UX.

## 🌟 Features

### User Features

- 🔐 **Secure Authentication** - JWT-based login/register with refresh tokens
- 📖 **Story Reading** - Clean, responsive reading interface
- 🔊 **Audio Support** - Listen to stories with built-in audio player
- 📑 **Bookmarks** - Save and organize favorite stories
- 💬 **Comments System** - Professional nested comments with replies
- 🌙 **Theme Support** - Dark/Light mode with persistence
- 📱 **Mobile Responsive** - Optimized for all devices

### Admin Features

- 📊 **Admin Dashboard** - Comprehensive content management
- ✍️ **Story Management** - Create, edit, and manage stories
- 📝 **Chapter Editor** - Rich text editor with media support
- 👥 **User Management** - User roles and permissions
- 💬 **Comment Moderation** - Approve/reject comments
- 📈 **Analytics** - View counts and user engagement

### Technical Features

- ⚡ **High Performance** - Optimized caching and lazy loading
- 🔒 **Security** - Rate limiting, CORS, and input validation
- 🐳 **Docker Ready** - Full containerization support
- 🔄 **Auto Backup** - Automated database backups
- 📊 **Monitoring** - Health checks and logging
- 🌐 **SEO Optimized** - Meta tags and sitemap generation

## 🛠️ Tech Stack

### Frontend

- **Next.js 14** - React framework with App Router
- **TypeScript** - Type-safe development
- **Tailwind CSS** - Utility-first styling
- **Redux Toolkit** - State management
- **Redux Persist** - State persistence

### Backend

- **Node.js + Express** - Server framework
- **PostgreSQL** - Primary database
- **Prisma ORM** - Database toolkit
- **JWT** - Authentication tokens
- **Multer** - File upload handling

### Infrastructure

- **Docker** - Containerization
- **Nginx** - Reverse proxy & load balancer
- **SSL/TLS** - HTTPS security
- **Let's Encrypt** - Free SSL certificates

## 🚀 Quick Start

### Prerequisites

- Docker & Docker Compose
- Git
- Domain name (for production)

### Local Development

1. **Clone Repository**

   ```bash
   git clone https://github.com/loihd98/webtruyen.git
   cd webtruyen
   ```

2. **Setup Environment**

   ```bash
   cp .env.dev.example .env.dev
   # Edit .env.dev with your local settings
   ```

3. **Start Development Server**

   ```bash
   docker-compose -f docker-compose.dev.yml up --build
   ```

4. **Access Application**
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:5000
   - Admin Panel: http://localhost:3000/admin
   - Nginx: http://localhost:8080

### Production Deployment

See [PRODUCTION_DEPLOYMENT_GUIDE.md](./PRODUCTION_DEPLOYMENT_GUIDE.md) for detailed production setup instructions.

**Quick Production Setup:**

1. **Setup Environment**

   ```bash
   cp .env.prod.example .env.prod
   # Configure production values
   ```

2. **Deploy**
   ```bash
   docker-compose -f docker-compose.prod.yml up --build -d
   ```

## 📁 Project Structure

```
webtruyen/
├── 📁 backend/                    # Node.js Backend
│   ├── 📁 src/
│   │   ├── 📁 controllers/        # API controllers
│   │   ├── 📁 routes/             # Express routes
│   │   ├── 📁 middleware/         # Custom middleware
│   │   ├── 📁 utils/              # Utilities
│   │   └── 📄 index.js            # Server entry
│   ├── 📁 prisma/                 # Database schema
│   └── 📁 uploads/                # File storage
├── 📁 frontend/                   # Next.js Frontend
│   ├── 📁 src/
│   │   ├── 📁 app/                # App Router pages
│   │   ├── 📁 components/         # React components
│   │   ├── 📁 hooks/              # Custom hooks
│   │   ├── 📁 store/              # Redux store
│   │   └── 📁 utils/              # Client utilities
│   └── 📁 public/                 # Static assets
├── 📁 nginx/                      # Nginx configs
├── 📁 ssl/                        # SSL certificates
├── 📄 docker-compose.prod.yml     # Production config
├── 📄 docker-compose.dev.yml      # Development config
├── 📄 .env.prod.example           # Production env template
├── 📄 .env.dev.example            # Development env template
└── 📄 README.md                   # This file
```

## 🔧 Configuration

### Environment Variables

#### Production (.env.prod)

- `DATABASE_URL` - PostgreSQL connection string
- `JWT_SECRET` - JWT signing secret
- `DOMAIN` - Your domain name
- `FRONTEND_URL` - Frontend URL
- `BACKEND_URL` - Backend API URL

#### Development (.env.dev)

- Same as production but with localhost URLs
- Relaxed security settings for development

### Docker Compose Files

- **docker-compose.prod.yml** - Production with SSL, monitoring, and security
- **docker-compose.dev.yml** - Development with hot reload and debugging
- **docker-compose.yml** - Legacy (use specific env files instead)

## 📊 API Documentation

### Authentication

- `POST /api/auth/login` - User login
- `POST /api/auth/register` - User registration
- `POST /api/auth/refresh` - Refresh access token

### Stories

- `GET /api/stories` - List stories with pagination
- `GET /api/stories/:slug` - Get story details
- `POST /api/stories` - Create story (admin)
- `PUT /api/stories/:id` - Update story (admin)

### Chapters

- `GET /api/chapters/:id` - Get chapter content
- `POST /api/chapters` - Create chapter (admin)
- `PUT /api/chapters/:id` - Update chapter (admin)

### Comments

- `GET /api/comments/chapter/:chapterId` - Get chapter comments
- `POST /api/comments` - Create comment
- `POST /api/comments/:id/reply` - Reply to comment
- `PUT /api/comments/:id/approve` - Approve comment (admin)

### Admin

- `GET /api/admin/stats` - Dashboard statistics
- `GET /api/admin/users` - User management
- `GET /api/admin/comments` - Comment moderation

## 🔐 Security Features

- **Rate Limiting** - API request throttling
- **CORS Protection** - Cross-origin request security
- **Input Validation** - Request data sanitization
- **SQL Injection Protection** - Prisma ORM safety
- **XSS Prevention** - Content Security Policy
- **HTTPS Enforcement** - SSL/TLS encryption
- **JWT Security** - Secure token handling

## 📈 Monitoring & Maintenance

### Health Checks

- `GET /health` - Application health status
- Docker health checks for all services
- Automated service restart on failure

### Backups

- **Automated Daily Backups** - Database and uploads
- **7-day Retention** - Automatic cleanup
- **Manual Backup Commands** - See [DATABASE_BACKUP_GUIDE.md](./DATABASE_BACKUP_GUIDE.md)

### Logs

- Application logs: `logs/backend/`
- Nginx logs: `logs/nginx/`
- PostgreSQL logs: `logs/postgres/`

## 🤝 Contributing

1. Fork the repository
2. Create feature branch: `git checkout -b feature-name`
3. Make changes and test thoroughly
4. Commit: `git commit -m "Add feature"`
5. Push: `git push origin feature-name`
6. Submit Pull Request

## 📝 Documentation

- [Production Deployment Guide](./PRODUCTION_DEPLOYMENT_GUIDE.md)
- [Database Backup Guide](./DATABASE_BACKUP_GUIDE.md)

## 🔗 Production Instance

- **Domain:** [vivutruyenhay.com](https://vivutruyenhay.com)
- **Server:** VPS at 103.199.18.123
- **SSL:** Let's Encrypt certificates
- **CDN:** Nginx static file serving

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For issues and questions:

- Create GitHub issue for bugs
- Check logs for troubleshooting
- Review documentation guides

---

**Built with ❤️ by the vivutruyenhay.com Team**
