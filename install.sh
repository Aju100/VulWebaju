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
# - RailsGoat                                          #
# - Nodegoat                                           #
# - DVgraphql                                          #
# - OAuth 2.0                                          #
# - XXE lab                                            #
# - Vulnerable-OAuth-2.0-Applications                  #
# - xxelab                                             #
# - dvwp                                               #
# - xssable                                            #
# - Tiredful-API-py3-beta                              #
# - SSRF_Vulnerable_Lab                                #
# - Bwapp                                              #
# - Multillidae                                        #
# - Wackopicko                                         #
# - XSS Lab(0l4bs)                                     #
# - Vulnerable API(vapi)                               # 
# - Govwa                                              #
########################################################

install_requirements(){
    sudo apt update -y
    sudo apt install git
    sudo apt install docker.io -y
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
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
    sudo docker run -d --rm -p 8001:80 vulnerables/web-dvwa
    echo "Running Dvwa at http://127.0.0.1:8001"
}

installOwaspJuiceShop(){
    install_requirements
    sudo docker run -d --rm -p 3000:3000 bkimminich/juice-shop
    echo "Running Owasp Juice shop at http://127.0.0.1:3000"
}

installWebgoat(){
    install_requirements
    sudo docker run -p -d 127.0.0.1:8080:8080 -p 127.0.0.1:9090:9090 -e TZ=Europe/Amsterdam webgoat/goatandwolf
    echo "Running webgoat at http://127.0.0.1:8080/WebGoat"
    echo "Running webwolf at http://127.0.0.1:9090"
}

installNodegoat(){
    install_requirements
    git clone https://github.com/OWASP/NodeGoat.git
    cd NodeGoat
    sudo docker-compose build
    sudo docker-compose up -d
    echo "Running Nodegoat at http://127.0.0.1:4000"
}

installDVGraphql(){
    install_requirements
    sudo docker pull dolevf/dvga
    sudo docker run -d -p 5000:5000 -e WEB_HOST=0.0.0.0 dolevf/dvga
    echo "Running Damm Vulnerable GraphQL at http://127.0.0.1:5000"
}

installOAuth(){
    install_requirements
    git clone https://github.com/koenbuyens/Vulnerable-OAuth-2.0-Applications
    cd Vulnerable-OAuth-2.0-Applications/insecureapplication
    sudo docker-compose up -d
    echo "Running attacker: http://127.0.0.1:1337, photoprint: http://127.0.0.1:3000, gallery http://127.0.0.1:3005"
}

installRailsgoat(){
    install_requirements    
    git clone https://www.github.com/OWASP/railsgoat
    cd railsgoat
    sudo docker-compose build
    sudo docker-compose run web rails db:setup
    sudo docker-compose up -d
    echo "Running Railsgoat at http://127.0.0.1:3000"
}

installXeelab(){
    install_requirements
    git clone https://github.com/jbarone/xxelab
    cd xxelab
    docker build -t xxelab .
    docker run -it --rm -p 127.0.0.1:5000:80 xxelab
    echo "Running XEELab at http://127.0.0.1:5000"
}

installdvwp(){
    install_requirements
    git clone https://github.com/vavkamil/dvwp
    cd dvwp
    docker-compose up -d
    echo "Running DVWP at http://127.0.0.1:31337"
}

installXsslab(){
    install_requirements
    docker run -d -p 5000:5000 csaju/xssable
    echo "Running XSSLab at http://127.0.0.1:5000"
}

installTiredAPI(){
    install_requirements
    sudo docker run -d -p 8000:8000 -it csaju/tiredful
    echo "Running TiredAPI at http://127.0.0.1:8000"
}

installVulnerablenginx(){
    install_requirements
    git clone https://github.com/detectify/vulnerable-nginx
    cd vulnerable-nginx
    docker-compose up -d
    echo "Running Vulnerablenginx at http://127.0.0.1:5000/cats/"
}

installSSRFvulnerable(){
    install_requirements
    sudo docker run -p -d 8082:80 csaju/ssrf_vulnerable_lab
    echo "Running SSRFVulnerable at http://127.0.0.1:8082/install.php"
}

installbwapp(){
    install_requirements
    sudo docker run -d -p 8083:80 feltsecure/owasp-bwapp
    echo "Running bwapp at http://127.0.0.1:8083/install.php"
}

installmultillidae(){
    install_requirements
    sudo docker run -d -p 8084:80 csaju/mutillidae
    echo "Running multillidae at http://127.0.0.1:8084/mutillidae/"
}

installWackopico(){
    install_requirements
    sudo docker pull csaju/wackopicko
    sudo docker run -d -p 8084:80 csaju/wackopicko
    echo "Running Wackopico at http://127.0.0.1:8084"
}

install0l4bs(){
    install_requirements
    sudo docker run --name web-ctf -d -it -p 8085:80 hightechsec/xsslabs
    echo "Running XSS Lab at http://127.0.0.1:8085"
}

installVapi(){
    install_requirements
    git clone https://github.com/roottusk/vapi
    cd vapi
    sudo docker-compose up -d
    echo "Running Vapi lab at http://127.0.0.1/vapi"
}

installgovwa(){
    install_requirements
    git clone https://github.com/0c34/govwa.git
    cd govwa
    sudo docker-compose up -d
    echo  "Running govwa at http://127.0.0.1:8888"

}

installALL(){
    install_requirements
    installDvwa
    installbwapp
    installDVGraphql
    installdvwp
    installVulnerablenginx
    installNodegoat
    installmultillidae
    installOAuth
    installXsslab
    installXeelab
    installWebgoat
    installTiredAPI
    installSSRFvulnerable
    installRailsgoat
    installOwaspJuiceShop
    installMonitor
    installWackopico
    install0l4bs
    installVapi
    installgovwa
}

cleanup(){
    sudo docker stop $(sudo docker ps -a -q)
    sudo docker rmi $(sudo docker images)
    sudo docker system prune
    sudo rm -r NodeGoat
    sudo rm -r Vulnerable-OAuth-2.0-Applications
    sudo rm -r railsgoat
    sudo rm -r railsgoat
    sudo rm -r WebGoat
    sudo rm -r railsgoat
    sudo rm -r xxelab
    sudo rm -r dvwp
    sudo rm -r xssable
    sudo rm -r Tiredful-API-py3-beta
    sudo rm -r SSRF_Vulnerable_Lab
    sudo rm -r govwa
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
    $(colorGreen '6)') Vulnerable OAuth 2.0 Applications
    $(colorGreen '7)') Railsgoat
    $(colorGreen '8)') XEElab
    $(colorGreen '9)') Damm Vulnerable Wordpress
    $(colorGreen '10)') XSSlab
    $(colorGreen '11)') TiredAPI
    $(colorGreen '12)') Vulnerablenginx
    $(colorGreen '13)') SSRFvulnerable
    $(colorGreen '14)') Bwapp
    $(colorGreen '15)') Multillidae
    $(colorGreen '16)') Wackopico
    $(colorGreen '17)') XSS Lab
    $(colorGreen '18)') Vulnerable API
    $(colorGreen '19)') Govwa
    $(colorGreen '20)') Install ALL labs
    $(colorGreen '21)') Reset
    $(colorGreen '22)') Exit
    $(colorGreen 'Choose an option to run:') 
    "    
    read a
    case $a in
        1) installDvwa ; main ;;
        2) installOwaspJuiceShop ; main ;;
        3) installWebgoat ; main ;;
        4) installNodegoat ; main ;;
        5) installDVGraphql ; main ;;
        6) installOAuth ; main ;;
        7) installRailsgoat ; main ;;
        8) installXeelab ; main ;;
        9) installdvwp ; main ;;
        10) installXsslab ; main ;;
        11) installTiredAPI ; main ;;
        12) installVulnerablenginx ; main ;;
        13) installSSRFvulnerable ; main ;;
        14) installbwapp ; main ;;
        15) installmultillidae ; main ;;
        16) installWackopico ; main ;;
        17) install0l4bs ; main ;;
        18) installVapi ; main ;;
        19) installgovwa ; main ;;
        20) installALL ; main ;;
        21) cleanup ; main ;;
        22) exit 1; main;;
    0) exit 0 ;;
    *) echo -e $red"Wrong option."$clear; 
    esac
}

main
