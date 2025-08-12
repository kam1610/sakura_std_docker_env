FROM ruby:2.5.9-slim-buster

# use archive repository
RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org/debian-security|http://archive.debian.org/debian-security|g' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99disable-check-valid-until

# get packages
RUN apt-get update && \
    apt-get install -y apache2 default-mysql-client bash vim && \
    a2enmod cgid && \
    rm -rf /var/lib/apt/lists/*

# cgi directory
RUN mkdir -p /usr/lib/www && chmod 755 /usr/lib/www

# accept execution
RUN echo '<Directory "/usr/lib/www">\n\
    Options +ExecCGI\n\
    AddHandler cgi-script .rb\n\
    Require all granted\n\
</Directory>' >> /etc/apache2/sites-enabled/000-default.conf

RUN sed -i 's|DocumentRoot /var/www/html|DocumentRoot /usr/lib/www/|g' /etc/apache2/sites-enabled/000-default.conf

# enable serve-cgi-bin.conf
RUN sed -i 's|#(Include conf-available/serve-cgi-bin.conf)|$1|g' /etc/apache2/sites-available/000-default.conf

# prepare script file
# COPY cgi-bin /usr/lib/www
# RUN chmod +x /usr/lib/cgi-bin/*.rb || true

# start service
CMD ["apachectl", "-D", "FOREGROUND"]