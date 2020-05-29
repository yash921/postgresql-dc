# Postgresql docker-compose
 postgresql with docker-compose

# Configure Docker-Compose

 We will configure Docker-Compose to use PostgreSQL by creating this docker-compose.yml:

# docker-compose.yml
```
 version: '3.3'
 services:
   database:
     image: postgres
     ports:
       - "5432:5432"
   volumes:
       - ./dumps/init.sql:/docker-entrypoint-initdb.d/init.sql
   environment:    
       POSTGRES_USER: postgresql_user
       POSTGRES_PASSWORD: postgresql_password
       POSTGRES_DB: employee_database

 volumes:
     dumps:     // named volumes can be managed easier using docker-compose
```
# Log In to PostgreSQL

## Start the Database
  Run `docker-compose up` to bring up the database.
```
  $ docker-compose up                             
  Creating volume "postgresql-with-docker-compose_database-data" with default driver
  Pulling database (postgres:)...
  latest: Pulling from library/postgres
  8d691f585fa8: Pull complete
  ...                                                                             
  6283090fa09d: Pull complete
  Digest: sha256:a4a944788084a92bcaff6180833428f17cceb610e43c828b3a42345b33a608a7                                                                                                                                     
  Status: Downloaded newer image for postgres:latest                                                        
  Creating postgresql-with-docker-compose_database_1 ... done                                  
  Attaching to postgresql-with-docker-compose_database_1                                                                                                                                                              
  database_1  | The files belonging to this database system will be owned by user "postgres".                                                                                                                         
  database_1  | This user must also own the server process.
  ...
  database_1  | 2019-11-17 20:33:02.208 UTC [1] LOG:  database system is ready to accept connections
  ```
 `Docker-Compose` will only download the image the first time you run this command
 
# Connect to the Database

 There are multiple ways of connecting to the database container. In this example, we will drop into the database container
 and use the psql client software that is already installed in the database container.

```
 $ docker-compose run database bash       # drop into the container shell
   database#   psql --host=database --username=postgresql_user  --dbname=employee_database
   Password for user unicorn_user: 
   psql (12.0 (Debian 12.0-2.pgdg100+1))
   Type "help" for help.
   employee_database=#
 
```

 When prompted to the password, enter the password we configured in our `docker-compose.yml`, e.g. `postgresql_password`.
 
 
 # verify table
  $ employee_database=# `\d`
  
  $ employee_database=# `select * from employee;`
  ```
     id |      email_address       | first_name | last_name 
----+--------------------------+------------+-----------
  1 | example@gmail.com | rohit     | sharma
(1 row)

  
  ```
  
 

  
  
  
  
  
  
