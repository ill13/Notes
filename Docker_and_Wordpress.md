### Wordpress and Docker

#### Setup Windows and Docker
1. Enable Hyper-V in your system.
2. Download **Docker Desktop for Windows**.
3. Install **Docker Desktop**

#### Setup Wordpress

1. Fire up Powershell
2. Navigate to the directory where you want to install Wordpress

    ```powershell
    mkdir ~/wordpress/
    cd ~/wordpress/
    ```
3. Create a new ```docker-compose.yml``` in the ```wordpress``` directory you just created and paste the content below. 
   

```yml

version: '2.3'

# Removed local volumes for speed, removed caching
# removed '- db_data:/var/lib/mysql:delegated'
# Added caching


services:
   db:
     image: mysql:5.7
     volumes:
       - db_data:/var/lib/mysql
     restart: always
     environment:
       MYSQL_ROOT_PASSWORD: wordpress
       MYSQL_DATABASE: wordpress
       MYSQL_USER: wordpress
       MYSQL_PASSWORD: wordpress
   wordpress:
     depends_on:
       - db
     image: wordpress:latest
     ports:
       - "8000:80"
     volumes:
        - wp-app:/var/www/html
        - ./uploads.ini:/usr/local/etc/php/conf.d/uploads.ini
     restart: always
     environment:
       WORDPRESS_DB_HOST: db:3306
       WORDPRESS_DB_USER: wordpress
       WORDPRESS_DB_PASSWORD: wordpress
       WORDPRESS_DB_NAME: wordpress
volumes:
    db_data: {}
    wp-app: {}
    
```


4. Also create a file called ```uploads.ini``` and edit it to add the following:

    ```ini
    file_uploads = On
    upload_max_filesize = 256M
    post_max_size = 256M
    ```

This will fix the Wordpress ``max_upload`` file size issue which you will run into later

5. Run this command in the ```wordpress``` directory to create the containers: 

    ```powershell
    docker-compose up -d
    ```
6. Open your browser and enter ```localhost:8000``` to display the WordPress setup screen


NOTES: 
- ~~The ```delegated``` part after ```mysql``` makes Wordpress much faster~~
- https://github.com/docker-library/wordpress/issues/375#issuecomment-463312572

***
#### ~~Surprise! Docker doesn't save!~~

1. Get a list of ```CONTAINER ID```s with:

```
docker ps -a
```

2. Commit changes with:

```
docker commit [CONTAINER_ID] [new_image_name]
```
My example: 
```
docker commit b78ad79ce2be wordpress_save
```



