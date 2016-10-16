# Docker related setup
sudo curl -fsSL https://get.docker.com/ | sh
sudo systemctl enable docker.service
sudo systemctl start docker
sudo usermod -aG docker vagrant
