#! /bin/bash

# Regular Colors
blk='\033[0;30m'          # Black
red='\033[0;31m'          # Red
grn='\033[0;32m'          # Green
ylw='\033[0;33m'          # Yellow
blu='\033[0;34m'          # Blue
mgn='\033[0;35m'          # Purple
cyn='\033[0;36m'          # Cyan
nrml='\033[0;37m'         # White
nc='\033[0m'              # No Color

printf "${blu}[INFO]${nrml} starting to setup packages...\n"

#INSTALL UBUNTU RESTRICTED EXTRA FOR MEDIA CODECS AND FLASH SUPPORT
printf "${ylw}[WARN]${nrml} Continue installing \"ubuntu restricted extras\"? [Y/n] "
read wish
if [[ $wish == Y* ]]; then
  printf "${blu}[INFO]${nrml} installing ubuntu restricted extra...\n"
  sudo apt-get install ubuntu-restricted-extras \
  && printf "${grn}[PASS]${nrml} Installed ubuntu restricted extra\n" \
  || printf "${red}[FAIL]${nrml} Install ubuntu restricted extra\n"
fi

#INSTALL STREAMING MUSIC SERVICE SUCH AS SPOTIFY
printf "${ylw}[WARN]${nrml} Continue installing \"spotify\"? [Y/n] "
read wish
if [[ $wish == Y* ]]; then
  printf "${blu}[INFO]${nrml} installing spotify...\n"
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 \
  && echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list \
  && sudo apt-get update \
  && sudo apt-get install spotify-client \
  && printf "${grn}[PASS]${nrml} Installed spotify\n" \
  || printf "${red}[FAIL]${nrml} Install spotify\n"
fi

#CUSTOMIZE THE LOOK AND FEEL OF UBUNTU 16.04
printf "${ylw}[WARN]${nrml} Continue installing \"unity tweak tool\"? [Y/n] "
read wish
if [[ $wish == Y* ]]; then
  printf "${blu}[INFO]${nrml} installing unity tweak tool...\n"
  sudo apt install unity-tweak-tool \
  && printf "${grn}[PASS]${nrml} Installed unity tweak tool\n" \
  || printf "${red}[FAIL]${nrml} Could not install unity tweak tool\n"
fi

#IMPROVE BATTERY LIFE AND REDUCE OVERHEATING WITH TLP
printf "${ylw}[WARN]${nrml} Continue installing \"TLP\" to improve battery life? [Y/n] "
read wish
if [[ $wish == Y* ]]; then
  echo installing TLP...
  sudo apt install tlp tlp-rdw
  sudo tlp start
fi

#Install Oracle Java 8 / 9 in Ubuntu 16.04, Linux Mint 18
printf "${ylw}[WARN]${nrml} Continue installing \"java 8\"? [Y/n] "
read wish
if [[ $wish == Y* ]]; then
  printf "${blu}[INFO]${nrml} installing java 8...\n"
  sudo add-apt-repository ppa:webupd8team/java \
  && sudo apt update \
  && sudo apt install oracle-java8-installer \
  && printf "${grn}[PASS]${nrml} Installed Java 8\n" \
  || printf "${red}[FAIL]${nrml} Could not install Java 8\n"
  printf "${blu}[INFO]${nrml} "; printf "$(java -version)\n"
  printf "${blu}[INFO]${nrml} setting java environment variables...\n"
  sudo apt install oracle-java8-set-default \
  && printf "${grn}[PASS]${nrml} Set Java environment variables\n" \
  || printf "${red}[FAIL]${nrml} Could not Set Java environment variables\n"
fi

#Install Git
printf "${ylw}[WARN]${nrml} Continue installing \"git\"? [Y/n] "
read wish
if [[ $wish == Y* ]]; then
  printf "${blu}[INFO]${nrml} installing git...\n"
  sudo apt install git \
  && printf "${grn}[PASS]${nrml} Installed git\n" \
  || printf "${red}[FAIL]${nrml} Could not install git\n"
  printf "${blu}[INFO]${nrml} $(git --version)\n"
  git config --global push.default simple \
  && printf "${grn}[PASS]${nrml} Default git credentials were configured\n" \
  || printf "${red}[FAIL]${nrml} Could not set default git credentials\n"
fi

#Install Google Chrome
printf "${ylw}[WARN]${nrml} Continue installing \"google chrome\"? [Y/n] "
read wish
if [[ $wish == Y* ]]; then
  printf "${blu}[INFO]${nrml} installing google chrome...\n"
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - \
  && sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
  && sudo apt-get update \
  && sudo apt-get install google-chrome-stable \
  && printf "${grn}[PASS]${nrml} Installed google chrome\n" \
  || printf "${red}[FAIL]${nrml} Could not install google chrome\n"
fi

#Install oh my zsh!
printf "${ylw}[WARN]${nrml} Continue installing \"oh my zsh!\"? [Y/n] "
read wish
if [[ $wish == Y* ]]; then
  printf "${blu}[INFO]${nrml} installing oh my zsh!...\n"
  sudo apt install zsh \
  && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" \
  && printf "${grn}[PASS]${nrml} Installed oh my zsh!\n" \
  || printf "${red}[FAIL]${nrml} Could not install oh my zsh!\n"
  printf "${blu}[INFO]${nrml} making oh my zsh! default shell...\n"
  chsh -s $(which zsh) \
  && printf "${grn}[PASS]${nrml} Made oh my zsh! default shell\n" \
  || printf "${red}[FAIL]${nrml} Could not make oh my zsh! default shell\n"
fi

#Install htop
printf "${ylw}[WARN]${nrml} Continue installing \"htop\"? [Y/n] "
read wish
if [[ $wish == Y* ]]; then
  printf "${blu}[INFO]${nrml} installing htop...\n"
  sudo apt install htop \
  && printf "${grn}[PASS]${nrml} Installed htop\n" \
  || printf "${red}[FAIL]${nrml} Could not install htop\n"
fi

#Install paper theme
printf "${ylw}[WARN]${nrml} Continue installing \"paper theme\"? [Y/n] "
read wish
if [[ $wish == Y* ]]; then
  printf "${blu}[INFO]${nrml} installing paper theme...\n"
  sudo add-apt-repository ppa:snwh/pulp \
  && sudo apt-get update \
  && sudo apt-get install paper-icon-theme \
  && sudo apt-get install paper-gtk-theme \
  && sudo apt-get install paper-cursor-theme \
  && printf "${grn}[PASS]${nrml} Installed paper theme\n" \
  || printf "${red}[FAIL]${nrml} Could not #install paper theme\n"
fi

#Install xclip for copying to clipboard
printf "${ylw}[WARN]${nrml} Continue installing \"xclip\"? [Y/n] "
read wish
if [[ $wish == Y* ]]; then
  printf "${blu}[INFO]${nrml} installing xclip...\n"
  sudo apt-get install xclip \
  && printf "${grn}[PASS]${nrml} Installed xclip\n" \
  || printf "${red}[FAIL]${nrml} Could not install xclip\n"

  printf "alias \"c=xclip -selection clipboard\"\nalias \"v=xclip -o -selection clipboard\"\n" >> ~/.zshrc \
  || printf "${red}[ERROR]${nrml} Could not reconfigure .zshrc with new alias\n"
  source ~/.zshrc \
  || printf "${red}[ERROR]${nrml} Could not source .zshrc\n"

fi

#Set synclient settings
printf "${ylw}[WARN]${nrml} Continue seting up synclient settings? [Y/n] "
read wish
if [[ $wish == Y* ]]; then
  printf "${blu}[INFO]${nrml} setting up synclient configurations...\n"
  touch ~/touchpad.sh && chmod +x ~/touchpad.sh \
  && echo "synclient HorizTwoFingerScroll=0 VertTwoFingerScroll=1 HorizEdgeScroll=1 VertEdgeScroll=0 TapButton1=1 TapButton2=0 TapButton3=0" >> ~/touchpad.sh \
  && gsettings set org.gnome.settings-daemon.peripherals.input-devices hotplug-command "~/touchpad.sh" \
  && printf "${grn}[PASS]${nrml} Done setting up synclient configurations\n" \
  || printf "${red}[FAIL]${nrml} Could not set up synclient configurations\n"
fi

printf "${blu}[INFO]${nrml} Setup is done.\n"
