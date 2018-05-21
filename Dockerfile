# images
FROM ubuntu:16.04

# python3-pip wget lsof apache2 apache2-dev(for pip3 install mod_wsgi)
RUN set -x && \
    apt-get update && \
    apt-get install -y vim git sudo openssh-server mlocate lsof python3 python3-pip python-dev python3-dev libffi-dev libssl-dev apache2 apache2-dev
    # Not use ...
    #pip3 install --upgrade pip && \
    #pip3 install virtualenv && \
RUN pip3 install mod_wsgi && \
    pip3 install falcon && \
    pip3 install python-lora
RUN useradd ubuntu && \
    echo 'ubuntu:password' |chpasswd && \
    gpasswd -a ubuntu sudo && \
	mkdir /home/ubuntu/ && \
    chmod 755 /home/ubuntu/ && \
	mkdir /home/ubuntu/script/ && \
	chmod 755 /home/ubuntu/script/
ADD python.conf /etc/apache2/sites-available/
RUN a2ensite python
ADD app.wsgi /home/ubuntu/script/
RUN chmod 755 /home/ubuntu/script/app.wsgi
ADD main.py /home/ubuntu/script/
RUN chmod 755 /home/ubuntu/script/main.py
RUN updatedb
ENTRYPOINT service apache2 start && tail -f /dev/null
