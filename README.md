# Docker Symfony (PHP7-FPM - NGINX - Postgis)

Docker-symfony gives you everything you need for developing Symfony application. This complete stack run with docker and [docker-compose (1.7 or higher)](https://docs.docker.com/compose/).

## Installation

1. Clone the inowas-Repository to the /var/www/ - folder

    ```bash 
    $ cd /var/www
    $ git clone https://github.com/inowas/inowas.git
     ```

2. Clone this repository 

    ```bash 
    $ git clone https://github.com/inowas/docker-symfony.git
     ```

3. Create a `.env` from the `.env.dist` file. Adapt it according to your symfony application

    ```bash
    $ cp .env.dist .env
    ```
     
4. Build/run containers with (with and without detached mode)

    ```bash
    $ docker-compose build
    $ docker-compose up -d
    ```

4. Prepare Symfony app and load fixtures
    
    ```bash
    $ docker-compose exec php bash
    $ bash /fixtures/loadFixtures
    ```

    1. Update app/config/parameters.yml

        ```bash
        database_host: postgres
        ...
        ...
        ...
        ```

5. Enjoy :-)