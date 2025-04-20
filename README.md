## Here are the steps to test your project:

**Note:1** Before running, ensure that the necessary volume folders are correctly set up.

**Note:2** I changed my academic information from this projct and replace it with `localhost` and `username`.

- Run with the Makefile using the command: `make` or `make up`

----- Mandatory WordPress

    + To view the WordPress page, enter the URL: `https://localhost`
    + To log in to the WordPress admin dashboard using credentials from your `.env` file, enter: `https://localhost/wp-login.php` and input the admin or user login and password from the `.env` file.

    + To log in to the MariaDB container, use the command: `docker exec -it mariadb mariadb -u <wordpress_db_user> -p<wordpress_db_password> wordpress` (Replace `<wordpress_db_user>` and `<wordpress_db_password>` with the values from your `.env` file).
    Verify that it's not empty by running: `SHOW TABLES;`

----- Redis Cache for WordPress

    + Access your WordPress admin dashboard: `https://localhost/wp-login.php`
    Navigate to the installed Redis Object Cache plugin. You should see a status page indicating that Redis is connected and working.
    + You can also check if Redis is running by executing this command: `docker exec -it redis redis-cli ping`. It should respond with "PONG" if Redis is running.


----- FTP Server

    + Use an FTP client like FileZilla (software).
    + Connect with these settings:
        * Host: `localhost`
        * Username: `ftpuser` (as defined in your `.env` file)
        * Password: `ftp123` (as defined in your `.env` file)
        * Port: `21`
    Click "Quickconnect" to establish the connection.


----- Static Website (Resume Site)

    + To test the static website, open a web browser and navigate to: `http://localhost:8080`


----- Adminer

    + To test Adminer, open a web browser and navigate to: `http://localhost:8081`
    + You should see the Adminer login screen.
    + Log in with these credentials:
        * System: MySQL (or MariaDB)
        * Server: `mariadb`
        * Username: `mg` (or the value of `WORDPRESS_DB_USER` in your `.env`)
        * Password: `mg123` (or the value of `WORDPRESS_DB_PASSWORD` in your `.env`)
        * Database: `wordpress` (or leave blank to see all databases)
    + Once logged in, you should be able to browse tables in the WordPress database.


----- Portainer

    + To test Portainer, open a web browser and navigate to: `http://localhost:9000`
    + On the first access, you'll be prompted to create an admin password.
    + After setting up, choose "Local" as the environment.
    + You should see a dashboard showing all your Docker containers, including the ones you've set up.
    + You can click on containers to see details, logs, and manage them.
