# images
FROM ubuntu:16.04

# python3-pip wget lsof apache2 apache2-dev(for pip3 install mod_wsgi)
RUN set -x && \
    apt-get update && \
    apt-get install -y vim git sudo openssh-server mlocate lsof python3 python3-pip python-dev python3-dev libffi-dev libssl-dev apache2 apache2-dev && \
    pip3 install --upgrade pip && \
    #pip3 install virtualenv && \
	pip install mod_wsgi && \
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
# http://kimh.github.io/blog/jp/docker/gothas-in-writing-dockerfile-jp/#treat_your_container_like_a_binary_with_cmd
ENTRYPOINT service ssh start && service apache2 start && tail -f /dev/null
