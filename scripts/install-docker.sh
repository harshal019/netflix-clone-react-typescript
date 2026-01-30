
sudo apt-get update -y 
sudo apt-get install docker.io -y
sudo usermod -aG docker $USER   #in my case is ubuntu
newgrp docker


#Give Docker access to Jenkins
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins

``
- After the docker installation, we create a sonarqube container (Remember to add 9000 ports in the security group).
```bash
# docker run -d --name sonar -p 9000:9000 sonarqube:lts-community
