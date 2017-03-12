#! /bin/bash

# Regular Colors
blk='\033[0;30m'        # Black
red='\033[0;31m'          # Red
grn='\033[0;32m'        # Green
ylw='\033[0;33m'       # Yellow
blu='\033[0;34m'         # Blue
mgn='\033[0;35m'       # Purple
cyn='\033[0;36m'         # Cyan
nrml='\033[0;37m'        # White
nc='\033[0m' # No Color

printf "${blu}[INFO]${nrml} starting to setup packages...\n"

#INSTALL UBUNTU RESTRICTED EXTRA FOR MEDIA CODECS AND FLASH SUPPORT
printf "${blu}[INFO]${nrml} installing ubuntu restricted extra...\n"
sudo apt-get install ubuntu-restricted-extras && printf "${grn}[PASS]${nrml} Installed ubuntu restricted extra\n" || printf "${red}[FAIL]${nrml} Install ubuntu restricted extra\n"

#INSTALL STREAMING MUSIC SERVICE SUCH AS SPOTIFY
printf "${blu}[INFO]${nrml} installing spotify...\n"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 && echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list && sudo apt-get update && sudo apt-get install spotify-client && printf "${grn}[PASS]${nrml} Installed spotify\n" || printf "${red}[FAIL]${nrml} Install spotify\n"

#CUSTOMIZE THE LOOK AND FEEL OF UBUNTU 16.04
printf "${blu}[INFO]${nrml} installing unity tweak tool...\n"
sudo apt install unity-tweak-tool && printf "${grn}[PASS]${nrml} Installed unity tweak tool\n" || printf "${red}[FAIL]${nrml} Could not install unity tweak tool\n"

#IMPROVE BATTERY LIFE AND REDUCE OVERHEATING WITH TLP
#echo installing TLP...
#sudo apt install tlp tlp-rdw
#sudo tlp start

#Install Oracle Java 8 / 9 in Ubuntu 16.04, Linux Mint 18
printf "${blu}[INFO]${nrml} installing java 8...\n"
sudo add-apt-repository ppa:webupd8team/java && sudo apt update && sudo apt install oracle-java8-installer && printf "${grn}[PASS]${nrml} Installed Java 8\n" || printf "${red}[FAIL]${nrml} Could not install Java 8\n"
printf "${blu}[INFO]${nrml} "; printf "$(java -version)\n"
printf "${blu}[INFO]${nrml} setting java environment variables...\n"
sudo apt install oracle-java8-set-default && printf "${grn}[PASS]${nrml} Set Java environment variables\n" || printf "${red}[FAIL]${nrml} Could not Set Java environment variables\n"

#Install Git
printf "${blu}[INFO]${nrml} installing git...\n"
sudo apt install git && printf "${grn}[PASS]${nrml} Installed git\n" || printf "${red}[FAIL]${nrml} Could not install git\n"
printf "${blu}[INFO]${nrml} $(git --version)\n"
git config --global push.default simple && printf "${grn}[PASS]${nrml} Set default git credentials\n" || printf "${red}[FAIL]${nrml} Could not set default git credentials\n"

#Install Google Chrome
printf "${blu}[INFO]${nrml} installing google chrome...\n"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && sudo apt-get update && sudo apt-get install google-chrome-stable && printf "${grn}[PASS]${nrml} Installed google chrome\n" || printf "${red}[FAIL]${nrml} Could not install google chrome\n" 

#Install oh my zsh!
printf "${blu}[INFO]${nrml} installing oh my zsh!...\n"
sudo apt install zsh && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && printf "${grn}[PASS]${nrml} Installed oh my zsh!\n" || printf "${red}[FAIL]${nrml} Could not install oh my zsh!\n"
printf "${blu}[INFO]${nrml} making oh my zsh! default shell...\n"
chsh -s $(which zsh) && printf "${grn}[PASS]${nrml} Made oh my zsh! default shell\n" || printf "${red}[FAIL]${nrml} Could not make oh my zsh! default shell\n"

#Install htop
printf "${blu}[INFO]${nrml} installing htop...\n"
sudo apt install htop && printf "${grn}[PASS]${nrml} Installed htop\n" || printf "${red}[FAIL]${nrml} Could not install htop\n"

#Set synclient settings
printf "${blu}[INFO]${nrml} setting up synclient configurations...\n"
touch /home/aria/touchpad.sh && chmod +x /home/aria/touchpad.sh && echo "synclient HorizTwoFingerScroll=0\nsynclient TapButton2=0 TapButton3=0" >> /home/aria/touchpad.sh && gsettings set org.gnome.settings-daemon.peripherals.input-devices hotplug-command "/home/aria/touchpad.sh" && printf "${grn}[PASS]${nrml} Done setting up synclient configurations\n" || printf "${red}[FAIL]${nrml} Could not set up synclient configurations\n"

#Install paper theme
#printf "${blu}[INFO]${nrml} installing paper theme...\n"
#sudo add-apt-repository ppa:snwh/pulp && sudo apt-get update && sudo apt-get install paper-icon-#theme && sudo apt-get install paper-gtk-theme && sudo apt-get install paper-cursor-theme && #printf "${grn}[PASS]${nrml} Installed paper theme\n" || printf "${red}[FAIL]${nrml} Could not #install paper theme\n"


printf "${blu}[INFO]${nrml} Setup is done.\n"
