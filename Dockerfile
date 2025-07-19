FROM ubuntu:24.04

RUN apt update && apt install -y openssh-server sudo python3

# Crear usuario ansible con contraseña y agregar a sudo
RUN useradd -ms /bin/bash ansible && echo 'ansible:ansible' | chpasswd && adduser ansible sudo

# Permitir sudo sin contraseña
RUN echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN mkdir /var/run/sshd

EXPOSE 22 80

CMD ["/usr/sbin/sshd", "-D"]
