FROM   centos:latest
MAINTAINER  tapas
RUN     yum install httpd* -y
COPY    ./code    /var/www/html
ADD     https://www.december.com/html/tutor/hello.html  /var/www/html
RUN     sed  -i "s/Listen 80/Listen 8090/g"   /etc/httpd/conf.d/http.conf
RUN     chown apache:root /var/log/messages     /var/log/httpd   /var/run/httpd
RUN     chmod   -R 770  /var/run/httpd          /var/log/httpd
WORKDIR /var/www/html

USER    apache
CMD     /usr/sbin/httpd  -DFOREGROUND
ENV     port 8090
EXPOSE   $port
