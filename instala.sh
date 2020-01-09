#!/bin/bash
clear
cd $HOME
SCPdir="/etc/newadm"
SCPinstal="$HOME/install"
SCPidioma="${SCPdir}/idioma"
SCPusr="${SCPdir}/ger-user"
SCPfrm="/etc/ger-frm"
SCPfrm3="/etc/adm-lite"
SCPinst="/etc/ger-inst"
rm $HOME/titan.sh
myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`;
SCPresq="aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL3RpdGFuc2VydmVycy92cHNjby9tYXN0ZXIvcmVxdWVzdA=="
SUB_DOM='base64 -d'

### fun_ip
MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
MIP2=$(wget -qO- ipv4.icanhazip.com)
[[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"

#apt-get install grep -y &>/dev/null
#apt-get remove apache2 -y > /dev/null 2>&1
apt-get purge apache2 -y > /dev/null 2>&1

[[ $(dpkg --get-selections|grep -w "gawk"|head -1) ]] || apt-get install gawk -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "mlocate"|head -1) ]] || apt-get install mlocate -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "lolcat"|head -1) ]] || apt-get install lolcat -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "net-tools"|head -1) ]] || apt-get install net-tools -y &>/dev/null
 
rm $(pwd)/$0 &> /dev/null

### COLORES Y BARRA

msg () {
BRAN='\033[1;37m' && VERMELHO='\e[31m' && VERDE='\e[32m' && AMARELO='\e[33m'
AZUL='\e[34m' && MAGENTA='\e[35m' && MAG='\033[1;36m' &&NEGRITO='\e[1m' && SEMCOR='\e[0m'
 case $1 in
  -ne)cor="${VERMELHO}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";;
  -ama)cor="${AMARELO}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verm)cor="${AMARELO}${NEGRITO}[!] ${VERMELHO}" && echo -e "${cor}${2}${SEMCOR}";;
  -azu)cor="${MAG}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verd)cor="${VERDE}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -bra)cor="${BRAN}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";;
  -bar2)cor="\e[0;31m➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖\e[0m" && echo -e "${cor}${SEMCOR}";;
  -bar)cor="${AZUL}${NEGRITO}========================================" && echo -e "${cor}${SEMCOR}";;
 esac
}



####INSTALAR PAQUETES PARA BANER Y AVISOS 

msg -bar
inst_components () {
echo -e "\033[92m  -- INSTALANDO Y ACTULIZANDO PAQUETES NECESARIOS -- "
msg -bar
sleep 2s
[[ $(dpkg --get-selections|grep -w "at"|head -1) ]] || apt-get install at -y &>/dev/null && mm_decho "  INSTALANDO at..............[✔️]" "0.08" 
[[ $(dpkg --get-selections|grep -w "nano"|head -1) ]] || apt-get install nano -y &>/dev/null && mm_decho "  INSTALANDO nano............[✔️]" "0.08"
[[ $(dpkg --get-selections|grep -w "bc"|head -1) ]] || apt-get install bc -y &>/dev/null && mm_decho "  INSTALANDO bc..............[✔️]" "0.08"
[[ $(dpkg --get-selections|grep -w "sudo"|head -1) ]] || apt-get install sudo -y &>/dev/null && mm_decho "  INSTALANDO sudo............[✔️]" "0.08"
[[ $(dpkg --get-selections|grep -w "lsof"|head -1) ]] || apt-get install lsof -y &>/dev/null && mm_decho "  INSTALANDO lsof............[✔️]" "0.08"
[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] || apt-get install figlet -y &>/dev/null && mm_decho "  INSTALANDO figlet..........[✔️]" "0.08"
[[ $(dpkg --get-selections|grep -w "cowsay"|head -1) ]] || apt-get install cowsay -y &>/dev/null && mm_decho "  INSTALANDO cowsay..........[✔️]" "0.08"
[[ $(dpkg --get-selections|grep -w "screen"|head -1) ]] || apt-get install screen -y &>/dev/null && mm_decho "  INSTALANDO screen..........[✔️]" "0.08"
[[ $(dpkg --get-selections|grep -w "python"|head -1) ]] || apt-get install python -y &>/dev/null && mm_decho "  INSTALANDO python..........[✔️]" "0.08"
[[ $(dpkg --get-selections|grep -w "python3"|head -1) ]] || apt-get install python3 -y &>/dev/null && mm_decho "  INSTALANDO python3.........[✔️]" "0.08"
[[ $(dpkg --get-selections|grep -w "python3-pip"|head -1) ]] || apt-get install python3-pip -y &>/dev/null && mm_decho "  INSTALANDO python3-pip.....[✔️]" "0.08"
[[ $(dpkg --get-selections|grep -w "curl"|head -1) ]] || apt-get install curl -y &>/dev/null && mm_decho "  INSTALANDO curl............[✔️]" "0.08"
[[ $(dpkg --get-selections|grep -w "ufw"|head -1) ]] || apt-get install ufw -y &>/dev/null && mm_decho "  INSTALANDO ufw.............[✔️]" "0.08"
[[ $(dpkg --get-selections|grep -w "unzip"|head -1) ]] || apt-get install unzip -y &>/dev/null && mm_decho "  INSTALANDO unzip...........[✔️]" "0.08"
[[ $(dpkg --get-selections|grep -w "zip"|head -1) ]] || apt-get install zip -y &>/dev/null && mm_decho "  INSTALANDO zip.............[✔️]" "0.08"
[[ $(dpkg --get-selections|grep -w "apache2"|head -1) ]] || {
 apt-get install apache2 -y &>/dev/null
 sed -i "s;Listen 80;Listen 85;g" /etc/apache2/ports.conf
 service apache2 restart > /dev/null 2>&1 &
 } && mm_decho "  INSTALANDO apache2.........[✔️]" "0.08"
 msg -bar2
 sleep 2
 clear 
}

inst_components

### FIXEADOR PARA SISTEMAS 86_64

idfix64_86 () {
msg -bar2
mm_decho "ENCASO DE PEDIR ALGUNA INSTALACION ESCOJA: y " "0.2"
apt-get update; apt-get upgrade 
apt-get install curl
apt-get install lsof
apt-get install sudo
apt-get install figlet
apt-get install cowsay
apt-get install bc
apt-get install python
apt-get install at 
sed -i "s;Listen 80;Listen 85;g" /etc/apache2/ports.conf
service apache2 restart
clear
msg -bar2
mm_decho "ESCOJER PRIMERO #All locales# Y LUEGO #en_US.UTF-8# " "0.2"
clear
export LANGUAGE=en_US.UTF-8\
  && export LANG=en_US.UTF-8\
  && export LC_ALL=en_US.UTF-8\
  && export LC_CTYPE="en_US.UTF-8"\
  && locale-gen en_US.UTF-8\
  && sudo apt-get -y install language-pack-en-base\
  && sudo dpkg-reconfigure locales
clear
}

msg -bar2
echo -e "\033[1;97m     ¿APLICAR PARCHES PARA CORREGIR ERRORES?" 
msg -bar2
echo -e "\033[1;32m 1- Escoja:(N) Para Instalacion Normal"
echo -e "\033[1;31m 2- Escoja:(S) Si ya intento instalar el script y\n precento errores, aplique este parche."
msg -bar2
echo -e "\033[1;39m Al preciona N continuara la instalacion Normalmente"
   msg -bar2
   read -p " [ S | N ]: " idfix64_86   
   [[ "$idfix64_86" = "s" || "$idfix64_86" = "S" ]] && idfix64_86
clear



fun_ip () {
MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
MIP2=$(wget -qO- ipv4.icanhazip.com)
[[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
}


funcao_idioma () {
 echo -e " "
msg -bar2
cowsay -f ghostbusters.cow "BIENVENIDO Y GRACIAS POR UTILIZAR VPS-CO TITAN_ORIGIN☁️" | lolcat
figlet ..TITAN.. | lolcat
 echo -e "     ESTE SCRIPT ESTA OPTIMIZADO A IDIOMA ESPAÑOL"
msg -bar2
pv="$(echo es)"
[[ ${#id} -gt 2 ]] && id="es" || id="$pv"
byinst="true"
}
install_fim () {
msg -ama "$(source trans -b es:${id} "Instalacion Completa, Utilize los Comandos"|sed -e 's/[^a-z -]//ig')" && msg bar2
echo -e " menu / adm" && msg -verm "$(source trans -b es:${id} "En seguida se reiniciara su VPS "|sed -e 's/[^a-z -]//ig')"
echo -e "   \033[1;41m   $(source trans -b es:${id} "INICIE SESION CUANDO SE CIERRE ESTA TERMINAL")   \033[0;37m"
mkdir /etc/crondbl  > /dev/null 2>&1 
mkdir /etc/rom  > /dev/null 2>&1
mkdir /etc/bin  > /dev/null 2>&1
mkdir /etc/nanobc  > /dev/null 2>&1
msg -bar2
rm -rf /etc/rc.local
echo '#!/bin/sh -e' >> /etc/rc.local
sudo chmod +x /etc/rc.local
echo '#!/bin/bash' > /bin/port5050
sudo chmod +x /bin/port5050
echo "sudo port5050 &&  sudo notfy ||" >> /etc/rc.local
echo "sleep 5s" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local
wget https://raw.githubusercontent.com/titanservers/vpsco/master/Install/notfy.sh -O /bin/notfy &> /dev/null
chmod +rwx /bin/notfy	
sleep 10
}
ofus () {
unset txtofus
number=$(expr length $1)
for((i=1; i<$number+1; i++)); do
txt[$i]=$(echo "$1" | cut -b $i)
case ${txt[$i]} in
".")txt[$i]="+";;
"+")txt[$i]=".";;
"1")txt[$i]="@";;
"@")txt[$i]="1";;
"2")txt[$i]="?";;
"?")txt[$i]="2";;
"3")txt[$i]="%";;
"%")txt[$i]="3";;
"/")txt[$i]="K";;
"K")txt[$i]="/";;
esac
txtofus+="${txt[$i]}"
done
echo "$txtofus" | rev
}
verificar_arq () {
[[ ! -d ${SCPdir} ]] && mkdir ${SCPdir}
[[ ! -d ${SCPusr} ]] && mkdir ${SCPusr}
[[ ! -d ${SCPfrm} ]] && mkdir ${SCPfrm}
[[ ! -d ${SCPinst} ]] && mkdir ${SCPinst}
[[ ! -d ${SCPfrm3} ]] && mkdir ${SCPfrm3}
case $1 in
"menu"|"message.txt")ARQ="${SCPdir}/";; #Menu
"dados.zip")ARQ="${SCPfrm3}/";; #painel
"painel.zip")ARQ="${SCPfrm3}/";; #painel
"usercodes")ARQ="${SCPusr}/";; #User
"openssh.sh")ARQ="${SCPinst}/";; #Instalacao
"squid.sh")ARQ="${SCPinst}/";; #Instalacao
"dropbear.sh")ARQ="${SCPinst}/";; #Instalacao
"openvpn.sh")ARQ="${SCPinst}/";; #Instalacao
"ssl.sh")ARQ="${SCPinst}/";; #Instalacao
"ssld.sh")ARQ="${SCPinst}/";; #Instalacao
"sslmanager.sh")ARQ="${SCPinst}/";; #Instalacao
"errormanager.sh")ARQ="${SCPinst}/";; #Instalacao
"shadown.sh")ARQ="${SCPinst}/";; #Instalacao
"shadowsock.sh")ARQ="${SCPinst}/";; #Instalacao
"shadowsocks.sh")ARQ="${SCPinst}/";; #Instalacao
"shadown.sh")ARQ="${SCPinst}/";; #Instalacao
"ssrrmu.sh")ARQ="${SCPinst}/";; #Instalacao
"shadowsocks.sh")ARQ="${SCPinst}/";; #Instalacao
"v2ray.sh")ARQ="${SCPinst}/";; #Instalacao
"vdoray.sh")ARQ="${SCPinst}/";; #Instalacao
"sockspy.sh"|"PDirect.py"|"PPub.py"|"PPriv.py"|"POpen.py"|"PGet.py")ARQ="${SCPinst}/";; #Instalacao
*)ARQ="${SCPfrm}/";; #Ferramentas
esac
mv -f ${SCPinstal}/$1 ${ARQ}/$1
chmod +x ${ARQ}/$1
}

NOTIFY () {
msg -bar
msg -ama " NOTIFY-(Notificasion Remota‼️) vps co "
msg -bar
echo -e "\033[1;94m Es una APP que le enviara notificasiones cuando\n un usuario sea bloquedo o este expirado, e info de VPS."
echo -e "\033[1;97m Primero Descargar el APP Notify"
echo -e "\033[1;92mDescargar:\033[1;34m https://www.dropbox.com/s/7sot0ed3bjm9sq5/Notify.apk"
echo -e "\033[1;97m Seguido instalela y abrala esta le genera un TOKEN"
msg -bar
echo -e "\033[1;91mEspere unos segundos instalando Paquetes"
#
apt-get install npm -y > /dev/null 2>&1
#
npm install -g notify-cli > /dev/null 2>&1
#
ln -s /usr/bin/nodejs /usr/bin/node > /dev/null 2>&1
#
npm cache clean -f > /dev/null 2>&1
#
npm install -g n > /dev/null 2>&1
#
n stable > /dev/null 2>&1
#
msg -bar
echo -e "\033[1;97mIgrese un nombre para el VPS:\033[0;37m"; read -p " " nombr
echo "${nombr}" > nombre.log
echo -e "\033[1;97mIgrese su TOKEN:\033[0;37m"; read -p " " key
notify -r $key > /dev/null 2>&1
msg -bar
echo -e "\033[1;32m    TOKEN AGREGADO CON EXITO"
msg -bar
NOM="$(less nombre.log)"
NOM1="$(echo $NOM)"
notify -i "✅MENSAJE DE PRUEBA EXITOSO✅" -t "🔰EN VPS IP: $NOM1🔰" > /dev/null 2>&1
echo -e "\033[1;34mSE ENVIO MENSAJE DE PRUEBA SI NO LLEGA CONTACTE A telegram @titan_origin "
}
fun_ip
wget -O /usr/bin/trans https://raw.githubusercontent.com/titanservers/vpsco/master/Install/trans &> /dev/null
wget https://raw.githubusercontent.com/titanservers/vpsco/master/Install/nombre.log &> /dev/null
wget -O /bin/Desbloqueo.sh https://www.dropbox.com/s/b5uwfw5i38set36/Desbloqueo.sh &> /dev/null
chmod +x /bin/Desbloqueo.sh
msg -bar2
msg -ama "[ NEW - ULTIMATE - SCRIPT ] ➣ \033[1;33m[\033[1;34m TITAN_ORIGIN \033[1;33m]"
[[ $1 = "" ]] && funcao_idioma || {
[[ ${#1} -gt 2 ]] && funcao_idioma || id="$1"
 }
Key="qra-atsilK0@84%ab97cda8f?K8888:8@@+95+84?+94@"
REQUEST=$(echo $SCPresq|$SUB_DOM)
IP="104.238.135.147" && echo "$IP" > /usr/bin/vendor_code
cd $HOME
msg -ne "Key: "
wget -O $HOME/lista-arq ${REQUEST}/lista-arq > /dev/null 2>&1 && echo -e "\033[1;32m Verified" || {
   echo -e "\033[1;32m Verified"
   invalid_key
   exit
   }
sleep 1s
updatedb
if [[ -e $HOME/lista-arq ]] && [[ ! $(cat $HOME/lista-arq|grep "KEY INVALIDA!") ]]; then
   msg -bar2
   msg -ama "$(source trans -b pt:${id} "BEM VINDO, OBRIGADO POR UTILIZAR"|sed -e 's/[^a-z -]//ig'): \033[1;31m[NEW-ULTIMATE]"
   [[ ! -d ${SCPinstal} ]] && mkdir ${SCPinstal}
   pontos="."
   stopping="$(source trans -b pt:${id} "Verificando Atualizacoes"|sed -e 's/[^a-z -]//ig')"
   for arqx in $(cat $HOME/lista-arq); do
   msg -verm "${stopping}${pontos}"
   wget -O ${SCPinstal}/${arqx} ${REQUEST}/${arqx} > /dev/null 2>&1 && verificar_arq "${arqx}" || error_fun
   tput cuu1 && tput dl1
   pontos+="."
   done
   sleep 1s
   msg -bar2
   listaarqs="$(locate "lista-arq"|head -1)" && [[ -e ${listaarqs} ]] && rm $listaarqs   
   cat /etc/bash.bashrc|grep -v '[[ $UID != 0 ]] && TMOUT=15 && export TMOUT' > /etc/bash.bashrc.2
   echo -e '[[ $UID != 0 ]] && TMOUT=15 && export TMOUT' >> /etc/bash.bashrc.2
   mv -f /etc/bash.bashrc.2 /etc/bash.bashrc
   echo "${SCPdir}/menu" > /usr/bin/menu && chmod +x /usr/bin/menu
   echo "${SCPdir}/menu" > /usr/bin/adm && chmod +x /usr/bin/adm
   inst_components
   echo "$Key" > ${SCPdir}/key.txt
   echo -e "${cor[2]}$(source trans -b es:${id} "Desea Instalar NOTIFY?(Default n)")"
   echo -e "\033[1;34mFUNICONA SOLO PARA VERCIONES UBUNTU 16.04x64 +"
   msg -bar2
   read -p " [ s | n ]: " NOTIFY   
   [[ "$NOTIFY" = "s" || "$NOTIFY" = "S" ]] && NOTIFY
   msg -bar2
   [[ ${byinst} = "true" ]] && install_fim
else
invalid_key
fi