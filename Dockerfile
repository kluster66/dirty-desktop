############################################
#From: os source
#
#Description:
#
#Version 0.0.9
#
###########################################

FROM ubuntu:latest
MAINTAINER Philippe "philippe.bazerbe@laposte.net"

#Depots, mises a jour et install
RUN apt-get update && apt-get upgrade -y -q && apt-get dist-upgrade -y -q && apt-get -y -q autoclean && apt-get -y -q autoremove

ENV DEBIAN_FRONTEND noninteractive

#################################################################
###########           partie installation              ##########
# 
#
#

# Partie 1: les softs principaux
#Installation de x2go
#RUN apt-get -y -q install xserver-xephyr 
#RUN add-apt-repository ppa:x2go/stable -y
RUN apt-get -y -q install openssh-server
RUN apt-get -y -q install xubuntu-desktop
RUN apt-get -y -q install openbox xinit pcmanfm chromium-browser xterm obconf obmenu

RUN add-apt-repository ppa:x2go/stable -y
RUN apt-get update
RUN apt-get install -y -q x2goserver x2goserver-xsession pwgen
#RUN apt-get install -y -q ubuntu-gnome-desktop ubuntu-gnome-default-settings
# PArtie 2 tout ce qui est optionnel 
RUN apt-get install -y -q locate ssh curl ntp

########## Tout ce qui concerne la configuration ############
#Partie 1 les users unix

# Création des users nécéssaires
RUN useradd -m user

# Modification des mots de passe
RUN echo 'user:pass' | chpasswd

# Partie 2 configuration 
#RUN sed -i 's/DisplayManager.requestPort/!DisplayManager.requestPort/g' /etc/X11/xdm/xdm-config
#RUN sed -i '/#any host/c\*' /etc/X11/xdm/Xaccess
#RUN ln -s /usr/bin/Xorg /usr/bin/X
#RUN echo X11Forwarding yes >> /etc/ssh/ssh_config
# partie 3 on construit les fichiers de parametre


#répertoire ou je vais etre quand je vais me connecter
WORKDIR /home/user/


#Shinken ecoute sur le port 5000
EXPOSE 22

#Démarrage des services
#CMD /home/shinken/my_commands.sh

