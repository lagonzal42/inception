# Inception Project

This project is part of the 42 curriculum and aims to set up a small infrastructure composed of different services using Docker Compose.

## Description

The Inception project involves setting up a small infrastructure using Docker Compose. The infrastructure consists of several services, including NGINX, WordPress, and MariaDB. Each service runs in a dedicated container, and communication between containers is established via a docker-network. The project also involves configuring NGINX to support TLSv1.2 or TLSv1.3 only and setting up WordPress with a MariaDB database.

## Usage

To get started with this project, follow these steps:

1. Clone this repository to your local machine.

2. Install Docker and Docker Compose if you haven't already.

3. Navigate to the project directory.

4. Update the `.env` file with your desired environment variables.

5. Run `docker-compose up -d` to build and start the containers.

6. Access the services via your web browser.

## Project Structure

The project directory contains the following files and directories:

- `docker-compose.yml`: Docker Compose configuration file for defining the services and their dependencies.
- `Dockerfile`: Dockerfile for building the NGINX container.
- `Dockerfile.wordpress`: Dockerfile for building the WordPress container.
- `Dockerfile.mariadb`: Dockerfile for building the MariaDB container.
- `entrypoint.sh`: Entry point script used by the containers.
- `nginx.conf`: NGINX configuration file.
- `.env`: Environment variables file.
