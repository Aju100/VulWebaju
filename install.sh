#!/usr/bin/env bash

########################################################
# Author: Aju Tamang                                   #
# Info: Script for setting up vulnerable webapp        #
# License: MIT (c)                                     #
########################################################



########################################################
# Script to load vulnerable web apps for learning      #
# - DVWA                                               #
# - Owasp Juice Shop                                   #
# - Web goat                                           #
# - Mutillidae                                         #
# - Nodegoat                                           #
# - DVgraphql                                          #
########################################################

install_requirements(){
    sudo apt update -y
    sudo apt install git
    sudo apt install docker.io -y
    sudo systemctl start docker
    sudo systemctl enable docker
}


# color pallet
readonly cf="\\033[0m"
readonly red="\\033[0;31m"
readonly green="\\033[0;32m"

# color functions
colorGreen(){
    echo -ne $green$1$clear
}

colorred(){
    echo -ne $red$1$clear
}


installDvwa(){
    install_requirements
    sudo docker run -d --rm -p 80:80 vulnerables/web-dvwa
    echo "Running Dvwa at localhost"
}

installOwaspJuiceShop(){
    install_requirements
    sudo docker run -d --rm -p 3000:3000 bkimminich/juice-shop
    echo "Running Owasp Juice shop at localhost or ip:3000"
}

installWebgoat(){
    install_requirements
    git clone https://github.com/WebGoat/WebGoat
    cd WebGoat
    sudo docker-compose up -d
    echo "Running webgoat at localhost or ip:8080"
    echo "Running webwolf at localhost or ip:9090"
}


installNodegoat(){
    install_requirements
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    git clone https://github.com/OWASP/NodeGoat.git
    cd NodeGoat
    sudo docker-compose build
    sudo docker-compose up -d
    echo "Running Nodegoat at localhost or ip:4000"
}

installDVGraphql(){
    install_requirements
    sudo docker pull dolevf/dvga
    sudo docker run -d -p 5000:5000 -e WEB_HOST=0.0.0.0 dolevf/dvga
    echo "Running Damm Vulnerable GraphQL at localhost or ip:5000"
}

installDvws(){
    install_requirements
}


installRailsgoat(){
    install_requirements
    git clone https://www.github.com/OWASP/railsgoat
    sudo docker-compose up -d
}

installbwapp(){
    install_requirements
    sudo docker run -d --rm -p 7000:7000 raesene/bwapp
    echo "Running bwapp at localhost or ip:7000"
}

installMutillidae(){
    install_requirements
    sudo docker run -d --rm -p 1000:1000 citizenstig/nowasp
    echo "Running Multidaee at localhost or ip:1000"
}

cleanup(){
    sudo docker stop $(docker ps -a -q)
    sudo docker rmi $(docker images)
    sudo docker system prune 
    sudo rm -r NodeGoat
}



printf """$green

____   ____    .__  __      __      ___.               __       
\   \ /   /_ __|  |/  \    /  \ ____\_ |__ _____      |__|__ __ 
 \   Y   /  |  \  |\   \/\/   // __ \| __ \__  \     |  |  |   |
  \     /|  |  /  |_\        /\  ___/| \_\ \/ __ \_   |  |  |  /
   \___/ |____/|____/\__/\  /  \___  >___  (____  /\__|  |____/ 
                          \/       \/    \/     \/\______|      
                                                                
                                                                                                                    
"""
main(){
    echo -ne "
    $(colorGreen)Learn pentesting using vulnerable webapps
    $(colorGreen '1)') DVWA
    $(colorGreen '2)') Owasp Juice Shop
    $(colorGreen '3)') Webgoat
    $(colorGreen '4)') Nodegoat
    $(colorGreen '5)') Damm Vulnerable GraphQL
    $(colorGreen '6)') Reset
    $(colorGreen '7)') Exit
    $(colorGreen 'Choose an option to run:') 
    "    
    read a
    case $a in
        1) installDvwa ; main ;;
        2) installOwaspJuiceShop ; main ;;
        3) installWebgoat ; main ;;
        4) installNodegoat ; main ;;
        5) installDVGraphql ; main ;;
        6) cleanup ; main ;;
    0) exit 0 ;;
    *) echo -e $red"Wrong option."$clear; 
    esac
}

main