DB_DATABASE=mediumDB
DB_USERNAME=medium
DB_PASSWORD=medium

1- Download the project to your localhost

2- create the database meduimDB, and add the username and password medium, with permission to mediumDB database

3- Open the project and run the commands 

php artisan migrate // to migrate the database 

php artisan migrate:fresh --seed // to add the dummy data

OR import the database file mediumDB in database folder

4- run php artisan storage:link

5- run the project

http://localhost/medium.com/public



5- first page (Home) contains all articles and the admin can create update or delete articles

