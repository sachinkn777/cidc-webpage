FROM httpd:2.4
RUN apt-get -y update 
#apt-get -y upgrade
RUN apt-get -y install apache2 
RUN apt-get install -y git
RUN git clone https://github.com/sachinkn777/cidc-webpage.git
RUN cp -r cidc-webpage/* /var/www/html/
RUN ls -ltr /var/www/html/
RUN hostname
EXPOSE 80
#RUN service apache2 start
#RUN service apache2 status
