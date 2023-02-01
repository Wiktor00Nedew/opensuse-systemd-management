FROM opensuse/leap:15.3

LABEL maintainer="Jakub Wolski <kubixwol@gmail.com>"
LABEL build_date="2022-12-30"

# Tell suse that this is a container
ENV container=docker

# Install systemd
RUN zypper install -y dbus-1 systemd-sysvinit && \
    cd /usr/lib/systemd/system/sysinit.target.wants/; \
    for i in *; do [ $i = systemd-tmpfiles-setup.service ] || rm -f $i; done ; \
    rm -f /usr/lib/systemd/system/multi-user.target.wants/* ; \
    rm -f /etc/systemd/system/*.wants/* ; \
    rm -f /usr/lib/systemd/system/local-fs.target.wants/* ; \
    rm -f /usr/lib/systemd/system/sockets.target.wants/*udev* ; \
    rm -f /usr/lib/systemd/system/sockets.target.wants/*initctl* ; \
    rm -f /usr/lib/systemd/system/basic.target.wants/* ; \
    rm -f /usr/lib/systemd/system/anaconda.target.wants/*

# install additional packages
RUN zypper install -y openssh-server openssh-clients sudo iproute2 vim nano

# disable not working PAM auth

RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

# configure sudo without password
RUN groupadd wheel # && sed -i '/wheel ALL=(ALL:ALL) NOPASSWD: ALL/s/^#//g' /etc/sudoers
COPY sudoers /etc/sudoers 

# add geeko user (Change given password as necessary)
RUN useradd -ms /bin/bash -G wheel geeko && echo 'geeko:changeme' | chpasswd

# Configure correct stop signal for systemd (makes stopping the container a lot faster)
STOPSIGNAL SIGRTMIN+3

# exspose sshd port
EXPOSE 22/tcp

# cgroups volume needed for systemd to work - this is only e suggestion!!! Volume is actually mapped in docker-compose.yml
VOLUME ["/sys/fs/cgroup"]

# configure healthcheck to make sure that systemd is working
HEALTHCHECK --interval=2m --timeout=10s --retries=2 CMD systemctl || exit 1 

# init as PID 1
CMD ["/sbin/init"]
