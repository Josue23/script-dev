#!/bin/bash

# http://askubuntu.com/questions/756181/installing-php-5-6-on-xenial-16-04#756186
# author: josuerodrigues@gmail.com

# List installed php packages
echo '\n============================================'
echo 'Listando os pacotes php instalados.'
dpkg -l | grep php| awk '{print $2}' |tr "\n" " "

# remove unneeded packages
echo '\n============================================'
echo 'Removendo todos os pacotes php instalados.'
sudo apt-get purge `dpkg -l | grep php| awk '{print $2}' |tr "\n" " "` -y

# install dependencies before add PPA
echo '\n============================================'
echo 'Instalando as dependências de pacotes.'
sudo apt-get install software-properties-common

# Add the PPA
echo '\n============================================'
echo 'Adicionando o ppa ppa:ondrej/php'
sudo add-apt-repository ppa:ondrej/php -y

# Install your PHP Version
echo '\n============================================'
echo 'Atualizando o sistema.'
sudo apt-get update

echo '\n============================================'
echo 'Instalando o Php 5.6'
sudo apt-get install php5.6 -y

# install php5.6 modules
echo '\n============================================'
echo 'Instalando os módulos Php.'
sudo apt-get install php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xml php-pear -y

echo '\n============================================'
echo 'removendo pacotes não necessários'
sudo apt-get autoremove

# Verify your version
echo '\n============================================'
echo 'A versão Php instalada é: '
sudo php -v
