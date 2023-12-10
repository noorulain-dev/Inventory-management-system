There are 2 folders in the system
One named docker and one named XAMPP

They both contain the same website with the same functionalities but some of the functionalities show errors in the Docker website due to possible version issues or other bugs
But the purpose of the project was communication among different containers inside Docker which is being fulfilled

So in order to test the website functionality, 
please turn on XAMPP and turn on Apache and MySQL, 
and run the file inside XAMPP folder by going to the following directory in the folder
LogINOUT/login.php

For testing the docker functionality, 
make sure u have docker desktop installed on your PC
and xampp is turned off
go to the folder directory in a command prompt
which is the Booking-appointment-system
and enter the following command first

docker-compose down 

this command will turn off all dockers containers
then in order to build the containers, use the following command

docker-compose up -d --build

then if u wish to track the CPU and RAM usage and other properties of the docker containers, this can be done using the following command

docker stats

now u should be able to view all running containers on docker desktop

u can click on the link next to phpmyadmin on docker desktop and it will redirect to that page on your browser where u can upload the database sql file if it is not viewable already

then in order to test the web servers,
go to the browser url field and enter the following link

localhost:8079/LogINOUT/login.php

and for the second web server enter the same link hosted on the other port

localhost:8080/LogINOUT/login.php

it can be tested that once one web server container is stopped, the other one still works perfectly fine
the docker can be stopped by pressing the pause button next to the container's name in the docker desktop

for testing the docker volumes and backup using minio, follow the steps below

log in to the website

the following are the credentials in the website

customer:
nooruain.17@gmail.com
sam123 (or if doesn't work try Sam123)

seller:
babysofia5601@gmail.com
sam123 (or if doesn't work try Sam123)

admin:
admin@admin.com
Password123


then on the customer's side, click on a product
add it to cart
click on buy now
then it should send an email to the seller and customer associated with the product with the attached receipt
additionally, it should save the receipt pdf in the docker volumes
this can be accessed by going to docker destop
clicking on the volumes tab on the top left of the page
and click on this link
booking-appointment-system_web_tmp

this should open to reveal a folder called receipts
the receipts are saved in that folder

now, the backups of those receipts are saved in Minio
they can be accessed by clicking on the link next to the minio container in the docker desktop 
which should redirect to minio's webpage
it should ask for credentials to login
which are the following
access key id:
AKIAZ6RUNNND6TSFDNVN

secret access key:
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

after logging in, u should be able to see zip folders of all backups

the backups are set to hourly, but they can be tested by setting it to every minute by going into the cron-backup folder in the directory using vs code and opening the .env file

this is the current schedule
CRON_BACKUP_SCHEDULE='0 * * * *'

for minutes, u can set it to 
CRON_BACKUP_SCHEDULE='* * * * *'

please feel free to reach out incase any errors occur while logging in or otherwise, thank you.

