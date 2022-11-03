```
____   ____    .__  __      __      ___.               __
\   \ /   /_ __|  |/  \    /  \ ____\_ |__ _____      |__|__ __
 \   Y   /  |  \  |\   \/\/   // __ \| __ \__  \     |  |  |   |
  \     /|  |  /  |_\        /\  ___/| \_\ \/ __ \_   |  |  |  /
   \___/ |____/|____/\__/\  /  \___  >___  (____  /\__|  |____/
                          \/       \/    \/     \/\______|


```

<b>VulWebaju</b> is a script that automates to set up your pentesting environment for learning purpose. This script will help you to install common vulnerable applications.

> Note: This script is only tested in Ubuntu. You can also use in multiple cloud providers(EC2,Google Compute Engine, Azure virual machines, DigitalOcean Droplets).

### Vulnerables webapps that you can install

- [DVWA](https://dvwa.co.uk/)
- [Owasp Juice Shop](https://github.com/bkimminich/juice-shop)
- [Web goat](https://github.com/WebGoat/WebGoat)
- [Nodegoat](https://github.com/OWASP/NodeGoat)
- [Damm Vulnerable GraphQL](https://github.com/dolevf/Damn-Vulnerable-GraphQL-Application)
- [Rails Goat](https://www.github.com/OWASP/railsgoat)
- [OAuth 2.0 Application](https://github.com/koenbuyens/Vulnerable-OAuth-2.0-Applications)
- [Xeelab](https://github.com/jbarone/xxelab)
- [DVWP](https://github.com/vavkamil/dvwp)
- [XSSLab](https://github.com/kiwicom/xssable)
- [TiredAPI](https://github.com/siddharthbezalwar/Tiredful-API-py3-beta)
- [Vulnerable Nginx](https://github.com/detectify/vulnerable-nginx)
- [SSRF Vulnerable Lab](https://github.com/incredibleindishell/SSRF_Vulnerable_Lab)
- [Wackopicko](https://github.com/adamdoupe/WackoPicko)
- [0l4bs](https://github.com/tegal1337/0l4bs)
- [Vapi](https://github.com/roottusk/vapi)
- [Govwa](https://github.com/0c34/govwa)
- [WannaRace](https://github.com/Xib3rR4dAr/WannaRace)
- [VulnLab](https://github.com/Yavuzlar/VulnLab.git)

### Installation

```bash
git clone https://github.com/Aju100/VulWebaju
cd VulWebaju
sudo ./install.sh
```

> Make sure you have installed [Docker](https://docs.docker.com/install/).

```bash
sudo apt update -y
sudo apt install git
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

You can use also call ```install_requirements``` function via install.sh script to install all requirements.

### Other labs
You can also try other labs if you are interested in learning.
- [Kubernetes Goat](https://github.com/madhuakula/kubernetes-goat)
- [Vulnerable Graphql Api](https://github.com/CarveSystems/vulnerable-graphql-api)
- [Websheep](https://github.com/marmicode/websheep)
- [Vfapi](https://github.com/naryal2580/vfapi)
- [Lets be bad guys](https://github.com/mpirnat/lets-be-bad-guys)
- [DSVW](https://github.com/stamparm/DSVW)
- [Dvpwa](https://github.com/anxolerd/dvpwa)
- [Go test bench](https://github.com/Contrast-Security-OSS/go-test-bench)
- [Generic University](https://github.com/InsiderPhD/Generic-University)
- [Cfngoat - Vulnerable Cloudformation Template](https://github.com/bridgecrewio/cfngoat)
- [TerraGoat](https://github.com/bridgecrewio/terragoat)
- [Wrong Secrets](https://github.com/commjoen/wrongsecrets)
- [VAmPI](https://github.com/erev0s/VAmPI)

### Contribute

Contributions are always welcome! Please read the [contribution guidelines](./CONTRIBUTING.md) first.

### Help

If you need any help anywhere in the process, you can open [Github issue](https://github.com/Aju100/VulWebaju/issues).

### License

This project is currently licensed under the MIT General Public License v3. i.e. we guarantee end users the freedom to run, study, share, and modify the software.

Made with ❤️ and Bash
