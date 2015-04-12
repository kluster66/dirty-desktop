# dirty-desktop
builder
docker build -t kluster/docker-desktop .



lancer la connexion:
docker run -t -i -p 8080:22 --name dock_desktop kluster/docker-desktop bash

ensuite lancer le service ssh
