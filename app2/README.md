# Default Django Template

The default django template here is provided as a starter for all CodeNation projects.

## Features
- Uses Django 2 and Python3.6 out of the box
- Designed to be used with **[Devspaces](http://devspaces-docs.ey.devfactory.com)**
- Default production Dockerfile also provided for fast deploy to prod environment
- ENV based config switch; setting an environment variable named APP_RUN_ENV allows you to select between
different database configurations
- SQLite DB auto-configured during Django tests
- LDAP-authentication enabled (can be changed by setting the `LDAP_ENABLED` field in secrets.yml)

## Setting up manually

*If you installed this using the `devspaces install:template` plugin, then ignore this section*

- Install Django (latest) on any python environment (virtualenv recommended)
- Run the following command within the environment:

```bash
django-admin startproject --template=/path/to/repo/cn-devtools/templates/python/project -e "py,conf,sh" your-project-name
```

## Usage on Devspaces

### Running the default Django server
- To run the server, just go to the `/data/your-project-name` directory and run the server using:
  ```bash
  python manage.py runserver 0.0.0.0:8000
  ```
- You can access your server on your local machine using the IP:Port assigned to you by your devspace
  - To view this, open another terminal window in the same local folder
  - Run the command:
    ```bash
    devspaces info
    ```
  - Use the given IP and the port corresponding to the 8000 port to access your webserver

### Running via Apache
- Apache configuration is built-in to this template. Simply run the following command:
    ```bash
    chmod +x deploy/start-devspaces.sh
    ./deploy/start-devspaces.sh
    ```
- The script collects static files in the your-project-name subfolder by default, and runs Apache in the foreground
- Apache logs are redirected to standard output for your convenience
    


### ENV based config switch
The default `Dockerfile.devspaces` is the dockerfile for the default Devspaces image.
By default, the `APP_RUN_ENV` variable in the built image is set to DEV. 

**To change DB config (for example, to use a `STAGING` database)**
- Exit the devspace (if currently inside it)
- Run the command
    ```bash
    devspaces cy addons:create mysql unique_mysql_db_name --suffix=STAGING
    ```
- This creates a MySQL DB in ContainerYard and injects the variables in your devspace.
If you have linked a ContainerYard environment with this devspace, you may choose to inject it within the environment as well.
- Set the `APP_RUN_ENV` variable to `STAGING`
    ```bash
    export APP_RUN_ENV="STAGING"
    ```
- Your app should now use the new database automatically

## Upcoming features

- Sample code-snippets for Celery tasks, APIs, Serializers, basically enough of everything so you never have to peek into the Django documentation
- A default jenkinsfile for basic CI/CD
- A cleaner way to maintain the settings.py file for multiple environments
- A better production-level settings.py
- Complex use-cases including:
  - Redirection of HTTP traffic to HTTPS in apache-conf
  - Global locks using the DB or Redis



