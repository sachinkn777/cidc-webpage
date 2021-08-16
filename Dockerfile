#FROM ubuntu:18.04
FROM httpd:2.4
RUN apt-get -y update 
#apt-get -y upgrade
#RUN apt-get -y install apache2 
#RUN apt-get install -y git
#RUN git clone https://github.com/sachinkn777/cidc-webpage.git
ADD index.html  /usr/local/apache2/htdocs/
ADD js  /usr/local/apache2/htdocs/
ADD css  /usr/local/apache2/htdocs/
ADD -r images  /usr/local/apache2/htdocs/
RUN ls -ltr /usr/local/apache2/htdocs/
#RUN hostname
EXPOSE 80
#RUN service apache2 start
#RUN service apache2 status

