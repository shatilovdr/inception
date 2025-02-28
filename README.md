# Inception

**Inception** is a container orchestration project designed to simplify the process of setting up and managing multi-container environments (NGINX, WordPress, MySQL).  

## Usage

⚠️To use this project, you must have **Docker and Docker Compose [installed](https://docs.docker.com/get-started/get-docker/)** on your system. ⚠️

To set up **Inception** in your local environment, clone the repository and build the Docker images:

```bash
  git clone git@github.com:shatilovdr/inception.git
  cd Inception
```

## Environment variables

Ensure that you have a .env file in the project directory with the necessary environment variables.
```
Note: The provided .env file is for demonstration purposes only(and should not be used in real production).
```

```
DOMAIN_NAME=dshatilo.42.fr          # Domain name of site for the project

# WordPress
WP_TITLE=Inception                  # Title of the WordPress site
WP_ADMIN=dshatilo42                 # Username for the WordPress admin account
WP_ADMIN_PASSWORD=hive42            # Password for the WordPress admin account
WP_ADMIN_EMAIL=dshatilo42@42.fr     # Email address for the WordPress admin account
WP_USER=dshatilo                    # Username for the author account in WordPress
WP_USER_EMAIL=dshatilo@42.fr        # Email address for the author account in WordPress
WP_USER_PASSWORD=hive               # Password for for the author account in WordPress

# Database
DB_HOSTNAME=mariadb                 # Host address of the MySQL database server
DB_NAME=wordpress_db                # Name of the MySQL database
DB_USER=dshatilo                    # Username for connecting to the MySQL database
DB_PASSWORD=hive                    # Password for the specified database user
```
### Managing the Containers
To manage the container network use make commands:

To start the containers:
```bash
  make up
```
To stop the containers:
```bash
  make down
```
To list all available commands:
```bash
  make help
```
