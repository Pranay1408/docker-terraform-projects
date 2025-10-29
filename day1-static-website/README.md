# Day 1: Docker Static Website

This project demonstrates how to containerize a simple static website using Docker and NGINX.

## Files
- index.html - Sample HTML page
- Dockerfile - Dockerfile to build the website image

## Commands

1. Build Docker image:
```bash
docker build -t my-static-website .
```

2. Run container:
```bash
docker run -d -p 80:80 --name static-site my-static-website
```

3. Access in browser:
http://<EC2_instance_public_IP>

4. Stop container:
```bash
docker stop static-site
docker rm static-site
```
