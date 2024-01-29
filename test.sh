#!/bin/bash
echo -e ''
curl -s https://scannerx.net/setup/logo.txt | bash && sleep 3
echo -e ''
GREEN="\e[32m"
NC="\e[0m"

dependiences () {
    echo -e '\e[0;33mİnstalling Dependiences\e[0m'
    echo -e ''
    sudo apt update
    sudo apt install ca-certificates curl gnupg lsb-release git htop liblz4-tool screen -y < "/dev/null"
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update 
}

docker () {
    sudo apt-get install docker-ce docker-ce-cli containerd.io -y
    mkdir sub_data
    sleep 3
}

array () {
 wget https://gist.githubusercontent.com/Wiezzel/604a0d812c40ae64899ed2361b43b0e5/raw/593d418ab0ac162979e8b57f0da5145c2fc74f81/run_worker.sh
 chmod +x run_worker.sh
 mkdir sub_data
}

oth_process () {
    exec docker run --rm subsquid/rpc-node:0.2.1 keygen >key
  }



PS3="What do you want?: "
select opt in İnstall quit; 
do

  case $opt in
    İnstall)
    echo -e '\e[1;32mThe installation process begins...\e[0m'
    sleep 1
    dependiences
    docker
    array
    oth_process
    info
    sleep 3
      break
      ;;
    quit)
    echo -e '\e[1;32mexit...\e[0m' && sleep 1
      break
      ;;
    *) 
      echo "Invalid $REPLY"
      ;;
  esac
done
