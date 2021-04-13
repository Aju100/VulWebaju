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
# - bwapp                                              #
# - Multidae                                           #
# - Nodegoat                                           #
########################################################

install_requirements(){
    sudo apt update -y
    sudo install docker.io -y
    sudo systemctl start docker
    sudo systemctl enable docker
}


# color pallet
readonly cf="\\033[0m"
readonly red="\\033[0;31m"
readonly green="\\033[0;32m"
readonly yellow="\\033[0;33m"
readonly purple="\\033[0;35m"

# color functions
colorGreen(){
    echo -ne $green$1$clear
}

colorred(){
    echo -ne $red$1$clear
}



installOwaspJuiceShop(){
    install_requirements
    sudo docker run -d --rm -p 3000:3000 bkimminich/juice-shop
    echo "Running Owasp Juice shop at localhost or ip:3000"
}

installDvwa(){
    install_requirements
    sudo docker run -d --rm -p 80:80 vulnerables/web-dvwa
    echo "Running Dvwa at localhost"
}

installWebgoat(){
    install_requirements
    sudo docker pull webgoat/webgoat-8.0
    sudo docker run -d --rm -p 8000:8000 webgoat/webgoat-8.0
    echo "Running webgoat at localhost or ip:5000"
}

installbwapp(){
    install_requirements
    sudo docker run -d --rm -p 2000:2000 raesene/bwapp
    echo "Running bwapp at localhost or ip:2000"
}

installMultidaee(){
    install_requirements
    sudo docker run -d --rm -p 1000:1000 citizenstig/nowasp
    echo "Running Multidaee at localhost or ip:1000"
}

installNodegoat(){
    install_requirements
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
}

installDvws(){
    install_requirements
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
    $(colorGreen '4)') bwapp
    $(colorGreen '5)') Multidaee
    $(colorGreen '6)') Nodegoat
    $(colorGreen '7)') DVGraphql
    $(colorGreen '8)') Reset
    $(colorGreen '0)') Exit
    $(colorGreen 'Choose an option to run:') 
    "    
    read a
    case $a in
        1) installDvwa ; main ;;
        2) installOwaspJuiceShop ; main ;;
        3) installWebgoat ; main ;;
        4) installbwapp ; main ;;
        5) installMultidaee ; main ;;
        6) installNodegoat ; main ;;
        7) installDVGraphql ; main ;;
        8) cleanup ; main ;;
    0) exit 0 ;;
    *) echo -e $red"Wrong option."$clear; 
    esac
}

main