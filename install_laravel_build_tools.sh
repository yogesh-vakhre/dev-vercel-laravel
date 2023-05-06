#!/bin/bash

echo "#####################################################################"
echo "# Description: Install required build tools for Laravel development #"
echo "# Created By: John Schaap                                           #"
echo "# Date: May 1st 2021                                                #"
echo "########################[ Comments ]#################################"
echo "# - May 16th 2021                                                    #"
echo "# -- added Python 3.8                                                #"
echo "# -- install PIP and EB CLI                                          #"
echo "# -- added sudo -k to remove sudo until sudo is called again - ln 74 #"
echo "#                                                                    #"
echo "#####################################################################"
#
echo "Change into home directory"
#
cd ~ # Change into home directory
#
echo "############################"
echo "Preparing to install PHP 8x cli"
echo "############################"
#
echo "Adding ppa:ondrej/php to the apt repository"
#
sudo add-apt-repository ppa:ondrej/php
#
echo "running apt update"
#
sudo apt update
#
echo "Installing PHP 8x cli"
#
sudo apt install php8.2-common php8.2-cli -y
#
echo "Installing PHP 8x extensions"
#
sudo apt install php8.2-{mbstring,dom,zip,mysql}
php -v # Show PHP version.
php -m # Show PHP modules loaded.
#
echo "PHP install complete"
#
echo "############################"
echo "Preparing to install Python 3.8"
echo "############################"
#
sudo apt install python3.8
#
echo "Python 3.8 install complete"
#
#################################################
#
echo "############################"
echo "Download and install PIP and EB CLI"
echo "############################"
#
curl -O https://bootstrap.pypa.io/get-pip.py
#
python3 get-pip.py --user
#
pip --version
#
pip install awsebcli --upgrade --user
#
eb --version
#
rm awscliv2.zip get-pip.py # remove download and install file
#################################################
#
echo "############################"
echo "Preparing to install Composer"
echo "############################"
echo "Downloading composer-setup.php"
#
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
#
echo "Checking the file SHA"
#
php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
#
echo "Running composer-setup.php"
#
php composer-setup.php
#
echo "Removing the composer-setup.php file name"
echo "composer.phar created"
#
php -r "unlink('composer-setup.php');"
#
echo "Creating ~/.local/bin directory"
#
###### Remove sudo for the following user specific commands #######
sudo -k # remove sudo until sudo is called again
 #
mkdir ~/.local/bin
#
echo "Moving composer.phar to ~/.local/bin/composer"
#
mv ~/composer.phar ~/.local/bin/composer
#
echo "add composer to ~/.bash_aliases"
#
#################### Append the following to .bash_aliases ###################
#
echo "alias composer='php ~/.local/bin/composer'" >>  ~/.bash_aliases
#
echo "Showing alias entries"
#
cat ~/.bash_aliases
#
echo "Running source ~/.bashrc"
#
source ~/.bashrc
#
composer about # show about composer
#
echo "Composer install complete"
#
#################################################
#
echo "############################"
echo "Preparing to install Nodejs and NPM"
echo "############################"
echo "running apt update"
#
sudo apt -y update
#
echo "Installing nodejs and npm"
#
sudo apt -y install nodejs npm
node --version # show node version
npm --version # show npm version
#
echo "Nodejs and NPM install complete"
echo "running apt update"
#
sudo apt -y update
#
echo "running apt upgrade"
#
sudo apt -y upgrade
#
echo "Updating nodejs to latest version"
echo "Install curl dirmngr apt-transport-https lsb-release ca-certificates"
#
sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
#
echo "Download and install setup"
#
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
#
echo "Install Nodejs"
#
sudo apt -y install nodejs
#
echo "Install gcc g++ make"
#
sudo apt -y  install gcc g++ make
#
echo "Remove unused dependencies"
#
sudo apt -y autoremove
#
echo "#########################################################################"
echo "#################### PHP modules loaded #################################"
echo "#########################################################################"
php -m # Show PHP modules loaded.
echo "#########################################################################"
echo "####################### PHP Version #####################################"
echo "#########################################################################"
php -v # show php version
echo "#########################################################################"
echo "####################### Python Version ##################################"
echo "#########################################################################"
python3 -V # show python version
echo "#########################################################################"
echo "######################## PIP Version ####################################"
echo "#########################################################################"
pip --version # show pip version
echo "#########################################################################"
echo "####################### EB CLI Version ##################################"
echo "#########################################################################"
eb --version # show eb cli version
echo "#########################################################################"
echo "###################### About Composer ###################################"
echo "#########################################################################"
composer about # show about composer
echo "#########################################################################"
echo "###################### Alias Entries ####################################"
echo "#########################################################################"
cat ~/.bash_aliases
echo "#########################################################################"
echo "################## Nodejs and NPM Versions ##############################"
echo "#########################################################################"
node --version # show node version
npm --version # show npm version
echo "#########################################################################"
echo "#########################################################################"
echo "##################### All done, enjoy :) ################################"
echo "#########################################################################"
echo "#########################################################################"
