#!/usr/bin/env bash

# Install system packages #####################################################

echo 'Cheking for Development Tools... '
if [[ ! $(yum grouplist Dev* installed) ]]; then
  yum makecache
  sudo yum -y update
  sudo yum -y groupinstall "Development Tools"
  sudo yum -y install wget nano openssl-devel python-devel libffi-devel
else
  echo 'OK'
fi


# Install Python 3 with Miniconda #############################################

echo 'Cheking for Miniconda Python... '
if ! conda --version; then
  wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
  bash Miniconda3-latest-Linux-x86_64.sh -b
  rm -rf Miniconda3-latest-Linux-x86_64.sh
  export PATH=/home/vagrant/miniconda3/bin:$PATH

  echo '# Miniconda Python' >> .bashrc
  echo "export PATH=/home/vagrant/miniconda3/bin:$PATH" >> .bashrc
else
  echo 'OK'
fi


# Install AWS CLI #############################################################

echo "Checking for AWS CLI... "
if ! aws --version; then
  pip install awscli
else
  echo 'OK'
fi


# Install Node Version Manager ################################################

echo "Checking for NVM... "
if [[ ! -x /home/vagrant/.nvm ]]; then
  wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

  export NVM_DIR="/home/vagrant/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
else
  export NVM_DIR="/home/vagrant/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

  nvm --version
  echo "OK"
fi


# Install Node.js #############################################################

echo "Checking for Node.js... "
if ! node --version; then
  nvm install 6.10
  nvm use 6.10
else
  echo 'OK'
fi


# Install Serverless & plugins ################################################

echo "Checking for Serverless Framework... "
if ! serverless --version; then
  # Install Serverless as global package
  npm install serverless -g
  # Link to emulate serverless AWS TASK_ROOT path
  sudo ln -s /vagrant /var/task
else
  echo 'OK'
fi


# Install direnv ##############################################################

echo "Checking for direnv... "
if ! direnv; then
  wget https://bin.equinox.io/c/4Jbv9XAvTAU/direnv-stable-linux-amd64.tgz
  sudo tar xvf direnv-stable-linux-amd64.tgz -C /usr/local/bin
  rm -rf direnv-stable-linux-amd64.tgz

  echo '# Hook direnv' >> ~/.bashrc
  echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
else
  echo 'OK'
fi

# Clean Yum cache #############################################################

yum clean all
