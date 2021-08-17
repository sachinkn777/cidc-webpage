#FROM ubuntu:18.04
From httpd:2.4
RUN ls -ltr
RUN apt-get -y update 
#apt-get -y upgrade
#RUN apt-get -y install apache2 
#RUN apt-get install -y git
#RUN git clone https://github.com/sachinkn777/cidc-webpage.git
COPY cidc-webpage/index.html  /usr/local/apache2/htdocs/
COPY cidc-webpage/js  /usr/local/apache2/htdocs/js
COPY cidc-webpage/css  /usr/local/apache2/htdocs/css
COPY cidc-webpage/images  /usr/local/apache2/htdocs/images
RUN ls -ltr /usr/local/apache2/htdocs/
#RUN hostname
EXPOSE 80
#RUN service apache2 start
#RUN service apache2 status

