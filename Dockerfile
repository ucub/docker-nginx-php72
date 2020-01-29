FROM centos:7
MAINTAINER Mang_Ucub <yusufsanjaya@gmail.com>
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum -y update; yum clean all
RUN yum -y install nginx
RUN yum -y install yum-utils; yum clean all
RUN yum-config-manager --enable remi-php72
RUN yum -y install php php-mcrypt php-cli php-gd php-curl php-mysql \
                  php-ldap php-zip php-fileinfo php-common php-soap \
                  php-bcmath php-xmlrpc php-pdo php-mbstring php-pear \
                  php-process php-intl php-xml php-opcache; yum clean all
RUN yum clean all
ADD php.ini /etc/
COPY ./nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["/usr/sbin/nginx","-g","daemon off;"]
