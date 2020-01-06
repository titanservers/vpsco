#!/bin/bash
Block="/etc/bin" && [[ ! -d ${Block} ]] && exit
Block > /dev/null 2>&1
clear
ccowsay -f ghostbusters.cow "Con esta herramienta puedes ver el trafico de red...." | lolcat 
figlet TITAN | lolcat
echo -e "\e[0;31m➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖\e[0m"
sudo apt install nload > /dev/null 2>&1
echo -e "\033[1;31mPARA SALIR DEL PANEL PRESIONE CTLR+C \e[0m"
sleep 5s
echo -e "\e[0;31m➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖\e[0m"

nload
