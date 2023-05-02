#!/bin/bash
###################################################################
# PANDORA ZERO - REDSWORD CYBER SECURTY - EVOLUTION PROCESS SCRIPT
###################################################################
# VAR
DEP_LIST_URL="https://raw.githubusercontent.com/RedSw0rd/PandoraZero/main/pandora-zero-latest-deps.list"
PZ_ARCHIVE_URL="http://192.168.1.50/pandorazero/download/versions/latest/pandora-zero-latest.tar.gz"
PZ_CHECKSUM_URL="http://192.168.1.50/pandorazero/download/versions/latest/pandora-zero-latest.sum"
sql_init_scripts="/var/lib/pandora-zero/install/sqlite-init-scripts/"
STATUS_OK="\r\t\t\t\t\t\t\t\t\t\t\t      [ \033[0;92mOK\033[0;37m ]"
STATUS_KO="\r\t\t\t\t\t\t\t\t\t\t\t      [ \033[0;91mK0\033[0;37m ]"
T=$(date +"%d%m%y-%s")
LOGFILE="p0-evolution-$T.log"

# BANNER
echo -e " \033[0;97m"
base64 -d <<<"4paI4paI4paI4paI4paI4paI4pWXICDilojilojilojilojilojilZcg4paI4paI4paI4pWXICAg4paI4paI4pWX4paI4paI4paI4paI4paI4paI4pWXICDilojilojilojilojilojilojilZcg4paI4paI4paI4paI4paI4paI4pWXICDilojilojilojilojilojilZcgICAgIOKWiOKWiOKWiOKWiOKWiOKWiOKWiOKVl+KWiOKWiOKWiOKWiOKWiOKWiOKWiOKVl+KWiOKWiOKWiOKWiOKWiOKWiOKVlyAg4paI4paI4paI4paI4paI4paI4pWXIArilojilojilZTilZDilZDilojilojilZfilojilojilZTilZDilZDilojilojilZfilojilojilojilojilZcgIOKWiOKWiOKVkeKWiOKWiOKVlOKVkOKVkOKWiOKWiOKVl+KWiOKWiOKVlOKVkOKVkOKVkOKWiOKWiOKVl+KWiOKWiOKVlOKVkOKVkOKWiOKWiOKVl+KWiOKWiOKVlOKVkOKVkOKWiOKWiOKVlyAgICDilZrilZDilZDilojilojilojilZTilZ3ilojilojilZTilZDilZDilZDilZDilZ3ilojilojilZTilZDilZDilojilojilZfilojilojilZTilZDilZDilZDilojilojilZcK4paI4paI4paI4paI4paI4paI4pWU4pWd4paI4paI4paI4paI4paI4paI4paI4pWR4paI4paI4pWU4paI4paI4pWXIOKWiOKWiOKVkeKWiOKWiOKVkSAg4paI4paI4pWR4paI4paI4pWRICAg4paI4paI4pWR4paI4paI4paI4paI4paI4paI4pWU4pWd4paI4paI4paI4paI4paI4paI4paI4pWRICAgICAg4paI4paI4paI4pWU4pWdIOKWiOKWiOKWiOKWiOKWiOKVlyAg4paI4paI4paI4paI4paI4paI4pWU4pWd4paI4paI4pWRICAg4paI4paI4pWRCuKWiOKWiOKVlOKVkOKVkOKVkOKVnSDilojilojilZTilZDilZDilojilojilZHilojilojilZHilZrilojilojilZfilojilojilZHilojilojilZEgIOKWiOKWiOKVkeKWiOKWiOKVkSAgIOKWiOKWiOKVkeKWiOKWiOKVlOKVkOKVkOKWiOKWiOKVl+KWiOKWiOKVlOKVkOKVkOKWiOKWiOKVkSAgICAg4paI4paI4paI4pWU4pWdICDilojilojilZTilZDilZDilZ0gIOKWiOKWiOKVlOKVkOKVkOKWiOKWiOKVl+KWiOKWiOKVkSAgIOKWiOKWiOKVkQrilojilojilZEgICAgIOKWiOKWiOKVkSAg4paI4paI4pWR4paI4paI4pWRIOKVmuKWiOKWiOKWiOKWiOKVkeKWiOKWiOKWiOKWiOKWiOKWiOKVlOKVneKVmuKWiOKWiOKWiOKWiOKWiOKWiOKVlOKVneKWiOKWiOKVkSAg4paI4paI4pWR4paI4paI4pWRICDilojilojilZEgICAg4paI4paI4paI4paI4paI4paI4paI4pWX4paI4paI4paI4paI4paI4paI4paI4pWX4paI4paI4pWRICDilojilojilZHilZrilojilojilojilojilojilojilZTilZ0K4pWa4pWQ4pWdICAgICDilZrilZDilZ0gIOKVmuKVkOKVneKVmuKVkOKVnSAg4pWa4pWQ4pWQ4pWQ4pWd4pWa4pWQ4pWQ4pWQ4pWQ4pWQ4pWdICDilZrilZDilZDilZDilZDilZDilZ0g4pWa4pWQ4pWdICDilZrilZDilZ3ilZrilZDilZ0gIOKVmuKVkOKVnSAgICDilZrilZDilZDilZDilZDilZDilZDilZ3ilZrilZDilZDilZDilZDilZDilZDilZ3ilZrilZDilZ0gIOKVmuKVkOKVnSDilZrilZDilZDilZDilZDilZDilZ0g"
echo -e "\033[0;37m\n------------------------------------------------------------------------------------------------"
echo -e "                               \033[0;92mE V O L U T I O N    P R O C E S S\033[0;37m"
echo "------------------------------------------------------------------------------------------------"
echo "$(date +"%d/%m/%y %H:%M:%S") PANDORA ZERO - EVOLUTION PROCESS STARTED" > $LOGFILE

# ROOT CHECK
echo -n "|>| Checking if we are r00t "
R=$(id -u)
if [[ $R -eq 0 ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
        echo "|!| We need root privilege. Please run this script as root "
        exit
fi

# RPI0 CHECK
echo -n "|>| Checking if we are on Raspberry Pi Zero 2 W Rev 1.0"
RASP=$(cat /proc/cpuinfo | grep "Model" | cut -d":" -f2 | sed 's/^ //')
if [[ "$RASP" == "Raspberry Pi Zero 2 W Rev 1.0" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
        echo "|!| Pandora Zero is based on Raspberry Pi Zero W Rev 1.1 "
        exit
fi

# OS CHECK
echo -n "|>| Checking if we are on Kali "
OS=$(cat /etc/os-release | grep "^ID" | grep -v LIKE | cut -d'=' -f2)
if [[ "$OS" -eq "kali" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
        echo "|!| Pandora Zero is based on Kali Linux. Please use Kali to run Pandora Zero"
        exit
fi

# PREVIOUS INSTALLATION CHECK
echo -n "|>| Checking for previous installation "
if [[ -e /var/www/pandora-zero ]]
then
        echo -e $STATUS_KO
        echo "|E| Previous installation found. Please run INVERSION script before."
        exit
else
        echo -e $STATUS_OK
fi

# DEPENDENCIES
echo -n "|>| Downloading deps list "
rm pandora-zero-latest-deps.list > /dev/null 2>&1
wget $DEP_LIST_URL > /dev/null 2>&1
if [[ -e pandora-zero-latest-deps.list ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo "|+| Checking dependencies"
COUNT=0
MISSED_PACKAGES=""
dos2unix pandora-zero-latest-deps.list > /dev/null 2>&1

while read line
do
        if [[ ! -z $line ]]
        then
                echo -n "--> $line "
                R=$(/usr/bin/apt-cache policy $line | head -2 | tail -1 | awk '{print $2}')

                if [ -z $R ] || [ "$R" == "(none)" ]
                then
                        echo -e $STATUS_KO
                        COUNT=$((COUNT+1))
                        MISSED_PACKAGES="$MISSED_PACKAGES $line"
                else
                        echo -e $STATUS_OK
                fi
        fi
done < pandora-zero-latest-deps.list
rm pandora-zero-latest-deps.list

if [[ $COUNT -gt 1 ]]
then
        echo -e "\n|!| $COUNT programs are not installed. Please install them before run this script."
        echo "|!| Run this command to back in buisness :"
        echo "|!| apt-get install$MISSED_PACKAGES"
        exit
fi

# DOWNLOAD ARCHIVES
echo "$(date +"%d/%m/%y %H:%M:%S") DOWNLOADING ARCHIVE FILE" >> $LOGFILE
echo -n "|>| Downloading Pandora Zero Archive "
wget $PZ_ARCHIVE_URL > /dev/null 2>&1
if [[ -e "pandora-zero-latest.tar.gz" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
        echo "|E| Archive download failed. Check your connectivity and if the url is reacheable"
        exit
fi

echo -n "|>| Generating checksum "
SUM=$(sha256sum pandora-zero-latest.tar.gz | awk '{print $1}')
if [[ -z $SUM ]]
then
        echo -e $STATUS_KO
else
        echo -e $STATUS_OK
        echo ">>> $SUM "
fi

echo -n "|>| Downloading checksum "
wget $PZ_CHECKSUM_URL > /dev/null 2>&1
if [[ -e "pandora-zero-latest.sum" ]]
then
        echo -e $STATUS_OK
        SUM2=$(cat pandora-zero-latest.sum)
        echo ">>> $SUM2 "
else
        echo -e $STATUS_KO
        echo "|!| Checksum file download failed. Check your connectivity and if the url is reacheable"
        exit
fi

echo -n "|>| Checking checksum "
SUM2=$(cat pandora-zero-latest.sum)
if [[ "$SUM" == "$SUM2" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
        echo "|!| Checksum comparaison failed. Please contact redsword cybersecurity to inform them"
        #exit
fi

echo -e "|+| \033[0;92mStarting Evolution Process\033[0;37m "

# DECOMPRESS ARCHIVES
echo "$(date +"%d/%m/%y %H:%M:%S") DECOMPRESSING ARCHIVE" >> $LOGFILE
echo -n "|>| Decompressing archive in /tmp directory "
tar -xzf pandora-zero-latest.tar.gz -C /tmp/
if [[ -e "/tmp/pandora-zero" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
        echo "|!| Decompression failed. What happen ?"
        exit
fi

if [[ -e "/tmp/pandora-zero/VERSION" ]]
then
        VERSION=$(cat /tmp/pandora-zero/VERSION)
        echo ">>> Found version : $VERSION"
fi

# INSTALL APP STRUCTURE
echo -n "|>| Moving pandora-www dir to /var/www/pandora-zero "
mv /tmp/pandora-zero/p0-www /var/www/pandora-zero
if [[ -e "/var/www/pandora-zero" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
        echo "|!| Directory move failed. What's happenned ?"
        exit
fi

echo -n "|>| Moving pandora-lib dir to /var/lib/pandora-zero "
mv /tmp/pandora-zero/p0-lib /var/lib/pandora-zero
if [[ -e "/var/lib/pandora-zero" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
        echo "|!| Directory move failed. What's happenned ?"
        exit
fi

# GIT
echo "|+| Cloning some GIT "
echo "$(date +"%d/%m/%y %H:%M:%S") CLONING" >> $LOGFILE
echo -n "--> Bluepy "
git clone https://github.com/IanHarvey/bluepy.git /var/lib/pandora-zero/git/bluepy >> $LOGFILE 2>&1
if [[ -e "/var/lib/pandora-zero/git/bluepy" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "--> Libcrafter "
git clone https://github.com/pellegre/libcrafter /var/lib/pandora-zero/git/libcrafter >> $LOGFILE 2>&1
if [[ -e "/var/lib/pandora-zero/git/libcrafter" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "--> impacket "
git clone https://github.com/SecureAuthCorp/impacket /var/lib/pandora-zero/git/impacket >> $LOGFILE 2>&1
if [[ -e "/var/lib/pandora-zero/git/impacket" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "--> mitm6 "
git clone https://github.com/fox-it/mitm6 /var/lib/pandora-zero/git/mitm6 >> $LOGFILE 2>&1
if [[ -e "/var/lib/pandora-zero/git/mitm6" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "--> rpitx "
git clone https://github.com/F5OEO/rpitx /var/lib/pandora-zero/git/rpitx >> $LOGFILE 2>&1
if [[ -e "/var/lib/pandora-zero/git/rpitx" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "--> fm_transmitter "
git clone https://github.com/markondej/fm_transmitter /var/lib/pandora-zero/git/fm_transmitter >> $LOGFILE 2>&1
if [[ -e "/var/lib/pandora-zero/git/fm_transmitter" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "--> jackit "
git clone https://github.com/insecurityofthings/jackit /var/lib/pandora-zero/git/jackit >> $LOGFILE 2>&1
if [[ -e "/var/lib/pandora-zero/git/jackit" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "--> wpspin "
git clone https://github.com/drygdryg/wpspin /var/lib/pandora-zero/git/wpspin >> $LOGFILE 2>&1
if [[ -e "/var/lib/pandora-zero/git/wpspin" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "--> blueborndetection "
git clone https://github.com/mjancek/BlueborneDetection /var/lib/pandora-zero/git/BlueborneDetection >> $LOGFILE 2>&1
if [[ -e "/var/lib/pandora-zero/git/BlueborneDetection" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi


echo -n "|>| Installing python3 modules (long step) "
echo "$(date +"%d/%m/%y %H:%M:%S") PYTHON MODULES INSTALLATION" >> $LOGFILE
#pip3 install pymetasploit3 >> $LOGFILE 2>&1
pip3 install -r /var/lib/pandora-zero/git/impacket/requirements.txt >> $LOGFILE 2>&1
pip3 install -r /var/lib/pandora-zero/git/mitm6/requirements.txt >> $LOGFILE 2>&1
# requiered by mitm6
pip3 install service_identity >> $LOGFILE 2>&1
# requiered by ntlmrelay
pip3 install pyasn1-modules >> $LOGFILE 2>&1
#
cd /var/lib/pandora-zero/git/impacket/
python3 setup.py install >> $LOGFILE 2>&1
echo -e $STATUS_OK


echo -n "|>| Installing ruby gem "
echo "$(date +"%d/%m/%y %H:%M:%S") RUBY GEMS INSTALLATION" >> $LOGFILE
gem install msfrpc-client >> $LOGFILE 2>&1
echo -e $STATUS_OK


# TOOLS
echo "$(date +"%d/%m/%y %H:%M:%S") COMPILING " >> $LOGFILE
echo -n "|>| Compiling libcrafter (very long step) "
cd /var/lib/pandora-zero/git/libcrafter/libcrafter
./autogen.sh >> $LOGFILE 2>&1
make >> $LOGFILE 2>&1
make install >> $LOGFILE 2>&1
ldconfig
echo -e $STATUS_OK

echo -n "|>| Compiling fm_transmitter "
cd /var/lib/pandora-zero/git/fm_transmitter
make >> $LOGFILE 2>&1
echo -e $STATUS_OK

echo -n "|>| Compiling BlueborneDetection "
cd /var/lib/pandora-zero/git/BlueborneDetection
gcc detectBlueborne.o -o detectBlueborne -lbluetooth >> $LOGFILE 2>&1
echo -e $STATUS_OK

echo -n "|>| Compiling doubledirect "
g++ /var/lib/pandora-zero/src/doubledirect_poc.cpp -o /usr/bin/doubledirect -lcrafter -lpthread >> $LOGFILE 2>&1
if [[ -e "/usr/bin/doubledirect" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
        echo "|W| Compilation failed ..."
fi

#
cd /root

echo -n "|>| Compiling reset.c "
gcc -o /var/lib/pandora-zero/binary/reset /var/lib/pandora-zero/src/reset.c 2>/dev/null
if [[ -e "/var/lib/pandora-zero/binary/reset" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
        echo "|W| Compilation failed ..."
fi

echo -n "|>| Copying configurations files "
cp /var/lib/pandora-zero/install/config/apps/* /var/lib/pandora-zero/config/apps/
cp /var/lib/pandora-zero/install/config/sys/* /var/lib/pandora-zero/config/sys/
if [[ -e "/var/lib/pandora-zero/config/apps/hostapd-mana.conf" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
        echo "|W| Installation failed ..."
fi

echo -n "|>| Installing rmtrack "
cp /var/lib/pandora-zero/install/rmtrack/rmtrack /usr/bin/rmtrack
if [[ -e "/usr/bin/rmtrack" ]]
then
        echo -e $STATUS_OK
        chmod +x /usr/bin/rmtrack
else
        echo -e $STATUS_KO
        echo "|W| Installation failed ..."
fi

echo -n "|>| Installing hostapd files "
cp /etc/init.d/hostapd /var/lib/pandora-zero/install/backup/hostapd_init
cp /etc/default/hostapd /var/lib/pandora-zero/install/backup/hostapd_default
mv /etc/init.d/hostapd /etc/init.d/hostapd.ORIGINAL
mv /etc/default/hostapd /etc/default/hostapd.ORIGINAL
cp /var/lib/pandora-zero/install/init.d/hostapd /etc/init.d/hostapd
cp /var/lib/pandora-zero/install/default/hostapd /etc/default/hostapd
if [ -e "/etc/init.d/hostapd" ] && [ -e "/etc/default/hostapd" ]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "|>| Copying bluetooth files "
cp /var/lib/pandora-zero/install/systemd/pan0.netdev /etc/systemd/network/pan0.netdev
cp /var/lib/pandora-zero/install/systemd/pan0.network /etc/systemd/network/pan0.network
cp /var/lib/pandora-zero/install/systemd/bt-agent.service /etc/systemd/system/bt-agent.service
cp /var/lib/pandora-zero/install/systemd/bt-network.service /etc/systemd/system/bt-network.service
if [ -e "/etc/systemd/network/pan0.netdev" ] && [ -e "/etc/systemd/network/pan0.network" ]  && [ -e "/etc/systemd/system/bt-agent.service" ] && [ -e "/etc/systemd/system/bt-network.service" ]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "|>| Modifying /etc/bluetooth/main.conf file "
cp /etc/bluetooth/main.conf /var/lib/pandora-zero/install/backup/main.conf
mv /etc/bluetooth/main.conf /etc/bluetooth/main.conf.ORIGINAL
cp /var/lib/pandora-zero/install/bluetooth/main.conf /etc/bluetooth/main.conf
if [[ -e "/etc/network/interfaces" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "|>| Copying machine-info file "
cp /var/lib/pandora-zero/install/bluetooth/machine-info /etc/machine-info
if [[ -e "/etc/machine-info" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "|>| Copying rc.local file "
#cp /etc/rc.local /var/lib/pandora-zero/install/backup/rc.local
#mv /etc/rc.local /etc/rc.local.ORIGINAL
cp /var/lib/pandora-zero/install/init.d/rc.local /etc/rc.local
if [[ -e "/etc/rc.local" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "|>| Modifying /boot/config.txt file "
cp /boot/config.txt /var/lib/pandora-zero/install/backup/boot_config.txt
cp /var/lib/pandora-zero/install/config/sys/boot_config.txt /boot/config.txt
chmod +x /boot/config.txt
if [[ -e "/boot/config.txt" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "|>| Modifying /etc/modules file "
echo "i2c-dev" | sudo tee -a /etc/modules
echo -e $STATUS_OK

echo -n "|>| Modifying /etc/network/interfaces file "
cp /etc/network/interfaces /var/lib/pandora-zero/install/backup/interfaces
mv /etc/network/interfaces /etc/network/interfaces.ORIGINAL
cp /var/lib/pandora-zero/install/interfaces/interfaces /etc/network/interfaces
cp /var/lib/pandora-zero/install/interfaces/pan0 /etc/network/interfaces.d/

if [[ -e "/etc/network/interfaces" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "|>| Modifying /etc/hostname file "
cp /etc/hostname /var/lib/pandora-zero/install/backup/hostname
mv /etc/hostname /etc/hostname.ORIGINAL
cp /var/lib/pandora-zero/install/network/hostname /etc/hostname
if [[ -e "/etc/hostname" ]]
then
        echo -e $STATUS_OK
        hostname $(cat /etc/hostname)
else
        echo -e $STATUS_KO
fi

echo -n "|>| Modifying /etc/hosts file "
cp /etc/hosts /var/lib/pandora-zero/install/backup/hosts
mv /etc/hosts /etc/hosts.ORIGINAL
cp /var/lib/pandora-zero/install/network/hosts /etc/hosts
if [[ -e "/etc/hostname" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "|>| Modifying /etc/resolv.conf file "
cp /etc/resolv.conf /var/lib/pandora-zero/install/backup/resolv.conf
mv /etc/resolv.conf /etc/resolv.conf.ORIGINAL
cp /var/lib/pandora-zero/install/network/resolv.conf /etc/resolv.conf
if [[ -e "/etc/hostname" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "|>| Modifying /etc/dnsmasq.conf file "
cp /etc/dnsmasq.conf /var/lib/pandora-zero/install/backup/dnsmasq.conf
mv /etc/dnsmasq.conf /etc/dnsmasq.conf.ORIGINAL
cp /var/lib/pandora-zero/install/dnsmasq/dnsmasq.conf /etc/dnsmasq.conf
cp /var/lib/pandora-zero/install/dnsmasq/dnsmasq-admin.conf /etc/dnsmasq.d/dnsmasq-admin.conf

#if [[ -e "/etc/dnsmasq.conf" ]]
if [[ -e "/etc/dnsmasq.d/dnsmasq-admin.conf" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "|>| Modifying /etc/apache2/ports.conf file "
cp /etc/apache2/ports.conf /var/lib/pandora-zero/install/backup/ports.conf
mv /etc/apache2/ports.conf /etc/apache2/ports.conf.ORIGINAL
cp /var/lib/pandora-zero/install/apache/ports.conf /etc/apache2/ports.conf
if [[ -e "/etc/apache2/ports.conf" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "|>| Modifying /lib/systemd/system/apache2.service file "
cp /lib/systemd/system/apache2.service /var/lib/pandora-zero/install/backup/apache2.service
mv /lib/systemd/system/apache2.service /lib/systemd/system/apache2.service.ORIGINAL
cp /var/lib/pandora-zero/install/apache/apache2.service /lib/systemd/system/apache2.service
if [[ -e "/lib/systemd/system/apache2.service" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "|>| Copying Apache VHost file "
cp /var/lib/pandora-zero/install/apache/pandora.conf /etc/apache2/sites-enabled/pandora.conf
if [[ -e "/etc/apache2/sites-enabled/pandora.conf" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

# CERTIFICATS
echo -n "|>| Generating X.509 certificat "
# rm /var/lib/pandora/certs/pandora/pdr.pem
# rm /var/lib/pandora/certs/pandora/pdr.key
openssl req -new -x509 -days 365 -subj '/C=XX/ST=NULL/L=NULL/O=Redsword Cyber Security/OU=Redsword Cyber Security/CN=www.redsword.net' -nodes -out /var/lib/pandora-zero/certs/pandora/pdr.pem -keyout /var/lib/pandora-zero/certs/pandora/pdr.key > /dev/null 2>&1
if [ -e "/var/lib/pandora-zero/certs/pandora/pdr.pem" ] && [ -e "/var/lib/pandora-zero/certs/pandora/pdr.key" ]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
        echo "|W| certificats generation failed. Please fix it later"
fi

# PLACING CRONTAB FILE
echo -n "|>| Copying crontab file "
cp /var/lib/pandora-zero/install/crontab/root /var/spool/cron/crontabs/root
if [[ -e "/var/spool/cron/crontabs/root" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

# PLACING MOTD FILES
echo -n "|>| Copying motd file "
cp /etc/motd /var/lib/pandora-zero/install/backup/motd
mv /etc/motd /etc/motd.ORIGINAL
cp /var/lib/pandora-zero/install/motd/motd /etc/motd
if [[ -e "/etc/motd" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

# PLACING SUDO FILE
echo -n "|>| Copying sudo file "
cp /var/lib/pandora-zero/install/sudo/p0-www-root /etc/sudoers.d/p0-www-root
if [[ -e "/etc/sudoers.d/p0-www-root" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

# FIXING Hamster-sidejack path
echo -n "|>| Fixing Hamster-sidejack path "
cp -p /usr/bin/ferret-sidejack /usr/lib/hamster-sidejack/ferret
if [[ -e "/usr/lib/hamster-sidejack/ferret" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

# CHECK ROOT PRIV
echo -n "|>| Checking if www-data have root privilege via sudo "
P=$(sudo -u www-data sudo -n id -u 2>/dev/null)
if [[ "$P" == "0" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

# START AT BOOT
echo "$(date +"%d/%m/%y %H:%M:%S") BOOT SERVICES " >> $LOGFILE
echo -n "|>| Activating some services at boot "
systemctl enable hciuart >> $LOGFILE 2>&1
systemctl enable bluetooth >> $LOGFILE 2>&1
systemctl enable systemd-networkd >> $LOGFILE 2>&1
systemctl enable bt-agent >> $LOGFILE 2>&1
systemctl enable apache2 >> $LOGFILE 2>&1
systemctl enable dnsmasq >> $LOGFILE 2>&1
#update-rc.d apache2 enable >> $LOGFILE 2>&1
#update-rc.d dnsmasq enable >> $LOGFILE 2>&1
systemctl unmask hostapd >> $LOGFILE 2>&1
# update-rc.d hostapd enable
echo -e $STATUS_OK

# APACHE MODULES
echo "|+| Enabling 5 Apache modules "
echo -n "--> ssl "
a2enmod ssl >> $LOGFILE 2>&1
if [[ -e "/etc/apache2/mods-enabled/ssl.load" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "--> proxy "
a2enmod proxy >> $LOGFILE 2>&1
if [[ -e "/etc/apache2/mods-enabled/proxy.load" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "--> proxy_http  "
a2enmod proxy_http >> $LOGFILE 2>&1
if [[ -e "/etc/apache2/mods-enabled/proxy_http.load" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "--> proxy_connect "
a2enmod proxy_connect >> $LOGFILE 2>&1
if [[ -e "/etc/apache2/mods-enabled/proxy_connect.load" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "--> rewrite "
a2enmod rewrite >> $LOGFILE 2>&1
if [[ -e "/etc/apache2/mods-enabled/rewrite.load" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi


echo "|+| Reloading some daemons "
echo -n "--> apache2 "
systemctl restart apache2 > /dev/null 2>&1
CR=$(systemctl is-active apache2)
if [[ "$CR" == "active" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "--> hciuart "
systemctl restart hciuart > /dev/null 2>&1
CR=$(systemctl is-active hciuart)
if [[ "$CR" == "active" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "--> bluetooth "
systemctl restart bluetooth > /dev/null 2>&1
CR=$(systemctl is-active bluetooth)
if [[ "$CR" == "active" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "--> systemd-networkd "
systemctl start systemd-networkd > /dev/null 2>&1
CR=$(systemctl is-active systemd-networkd)
if [[ "$CR" == "active" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "--> bt-network "
systemctl start bt-network > /dev/null 2>&1
CR=$(systemctl is-active bt-network)
if [[ "$CR" == "active" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "--> bt-agent "
systemctl start bt-agent > /dev/null 2>&1
CR=$(systemctl is-active bt-agent)
if [[ "$CR" == "active" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

# NEED TO BE THE LAST (ERROR IF PAN0 NOT READY)
echo -n "--> dnsmasq "
systemctl restart dnsmasq > /dev/null 2>&1
CR=$(systemctl is-active dnsmasq)
if [[ "$CR" == "active" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo -n "|>| Installing DB "
php -f $sql_init_scripts/sqlite-init-global.php
php -f $sql_init_scripts/sqlite-init-xlist.php
php -f $sql_init_scripts/sqlite-init-taskman.php

echo -n "|>| Setting owner to www-data "
chown -R www-data: /var/www/pandora-zero
chown -R www-data: /var/lib/pandora-zero
find /var/lib/pandora-zero/scripts/pandora -type f -name "*.sh" -exec chmod +x {} \;
#chmod +x /var/lib/pandora-zero/scripts/pandora/system/boot.sh
echo -e $STATUS_OK

echo -n "|>| Disabling the Windows Manager (GUI) "
systemctl set-default multi-user.target > /dev/null 2>&1
echo -e $STATUS_OK

sleep 3
#echo -n "|>| Enabling the discovery "
#bt-adapter --set Discoverable 1 > /dev/null 2>&1
#echo -e $STATUS_OK

echo -n "|>| Cleanning "
rm /root/pandora-zero-latest.tar.gz
rm /root/pandora-zero-latest.sum
rm -rf /tmp/pandora-zero
if [[ ! -e "/tmp/pandora-zero" ]]
then
        echo -e $STATUS_OK
else
        echo -e $STATUS_KO
fi

echo "------------------------------------------------------------------------------------------------"
echo -e "                   \033[0;92mE V O L U T I O N    P R O C E S S    T E R M I N A T E D\033[0;37m"
echo "------------------------------------------------------------------------------------------------"
echo "| |  "
echo "|+|  DONE - CODE OVER"
echo "$(date +"%d/%m/%y %H:%M:%S") PANDORA ZERO - EVOLUTION PROCESS TERMINATED" >> $LOGFILE
echo "|+|  Sending Reboot command "
reboot
