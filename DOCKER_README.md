# Docker Setup for Traffic Monitoring System - User Service

## Prerequisites
- Docker & Docker Compose installed
- Maven 3.9+ (for local builds)
- Java 21 (for local development)

## Quick Start

### Build and Run with Docker Compose

```bash
# Build and start all services
docker-compose up -d

# View logs
docker-compose logs -f userservice

# Stop services
docker-compose down

# Stop services and remove volumes (clean up database)
docker-compose down -v
```

## Project Structure

### Files Created:
- **Dockerfile** - Multi-stage build for optimized image size
- **docker-compose.yml** - Orchestrates PostgreSQL and Spring Boot application
- **.dockerignore** - Excludes unnecessary files from Docker context
- **application-docker.yaml** - Docker-specific Spring Boot configuration
- **.env.example** - Environment variables template

## Services

### PostgreSQL Database
- **Image**: postgres:16-alpine
- **Port**: 5432 (mapped to localhost:5432)
- **Database**: traffic_monitoring
- **User**: postgres
- **Password**: FOsx2at1BTDVs7d667Hy

### User Service (Spring Boot)
- **Port**: 8080 (mapped to localhost:8080)
- **Database URL**: jdbc:postgresql://postgres:5432/traffic_monitoring
- **Health Check**: Enabled with 30s interval

## Configuration Details

### Docker Build Process:
1. **Stage 1 (Builder)**: Maven builds the application
2. **Stage 2 (Runtime)**: Only JRE included for smaller image size

### Key Features:
- ✅ Multi-stage Docker build (optimized image)
- ✅ Docker Compose for easy orchestration
- ✅ Health checks for both services
- ✅ Named volumes for PostgreSQL data persistence
- ✅ Custom network for service-to-service communication
- ✅ Environment variable support

## Useful Commands

```bash
# Build without starting
docker-compose build

# Start in background
docker-compose up -d

# View service status
docker-compose ps

# Access PostgreSQL
docker-compose exec postgres psql -U postgres -d traffic_monitoring

# Rebuild and restart services
docker-compose up -d --build

# View application logs
docker-compose logs userservice -f

# Stop all services
docker-compose stop

# Remove all containers
docker-compose rm
```

## Accessing the Application

- **Application URL**: http://localhost:8080
- **MySQL**: localhost:3306
- **Database Name**: traffic_monitoring
- **MySQL Root User**: root
- **MySQL Root Password**: root

## Environment Variables

Create a `.env` file from `.env.example` to customize:
```bash
cp .env.example .env
```

Edit `.env` with your custom values before running `docker-compose up`.

## Troubleshooting

### Database Connection Issues
```bash
# Check if MySQL is running
docker-compose ps mysql

# View MySQL logs
docker-compose logs mysql

# Connect to MySQL
docker-compose exec mysql mysql -u root -p traffic_monitoring
```

### Application Won't Start
```bash
# View application logs
docker-compose logs userservice

# Rebuild the image
docker-compose build --no-cache
```

### Port Already in Use
```bash
# Change ports in docker-compose.yml
# ports:
#   - "8081:8080"  # Use different host port
```

## Production Considerations

Before deploying to production:

1. Update passwords in docker-compose.yml and .env
2. Change `ddl-auto` from `update` to `validate`
3. Use proper secret management instead of hardcoded credentials
4. Configure proper logging and monitoring
5. Set up persistent backup strategies for PostgreSQL
6. Use specific image tags instead of "latest"
7. Configure resource limits in docker-compose.yml

Example resource limits:
```yaml
services:
  userservice:
    deploy:
      resources:
        limits:
          cpus: '1'
          memory: 512M
        reservations:
          cpus: '0.5'
          memory: 256M
```

## Cleaning Up

```bash
# Remove all containers and networks (keep volumes)
docker-compose down

# Remove everything including volumes
docker-compose down -v

# Remove dangling images
docker image prune -f
```

