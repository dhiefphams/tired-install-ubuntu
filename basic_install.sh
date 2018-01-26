# Install main package
echo 'Install basic package'
sudo apt-get update && sudo apt-get install curl wget python3-dev cryptsetup -y

EXTRACT_INSTALL=""
if [$CUDA]; then
    # Cuda
    CUDA_VERSION=9.1.85
    # echo 'Install cuda and nvidia'
    curl 'http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1704/x86_64/cuda-repo-ubuntu1704_${CUDA_VERSION}-1_amd64.deb' -o /tmp/cuda.deb
    sudo dpkg -i /tmp/cuda.deb
    rm -rf /tmp/cuda.deb
    sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1704/x86_64/7fa2af80.pub
    EXTRACT_INSTALL=${EXTRACT_INSTALL} cuda
fi

# VsCode
echo 'Install VsCode'
curl -L https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
echo 'deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main' | sudo tee /etc/apt/sources.list.d/vscode.list

# Sublime
echo 'Install Sublime'
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# nodejs
echo 'Install NodeJS'
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -

# yarn
echo 'Install Yarn'
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Java
echo 'Install Java'
sudo add-apt-repository ppa:webupd8team/java -y

# Chrome
echo 'Install Chrome'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - \
&& echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> sudo tee /etc/apt/sources.list.d/google-chrome.list

# NVIM
echo 'Install NeoVIM'
echo 'deb http://ppa.launchpad.net/neovim-ppa/stable/ubuntu zesty main' | sudo tee /etc/apt/sources.list.d/neovim.list \
&& sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 9DBB0BE9366964F134855E2255F96FCF8231B6DD

# Git
echo 'Install Git'
sudo add-apt-repository ppa:git-core/ppa -y

# Skype for linux
echo 'Install Skype'
curl https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add -
echo "deb [arch=amd64] https://repo.skype.com/deb stable main" | sudo tee /etc/apt/sources.list.d/skype-stable.list

# Numix Theme
echo 'Install Numix Theme'
sudo add-apt-repository ppa:numix/ppa -y

# Docker
echo 'Install docker'
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Psensor
echo 'Install psensor'
sudo apt-get install lm-sensors
sudo add-apt-repository "deb http://ppa.launchpad.net/jfi/ppa/ubuntu xenial main"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 551B119C302ECC9B9CF0B975FFB0B9D98EA3D2BF


# Pomodo indicator
echo 'Install pomodoro indicator'
sudo add-apt-repository ppa:atareao/atareao -y

## Golang
echo 'Install golang'
GO_VERSION=1.9.2
GOFILE=/tmp/golang.tar.gz
wget https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz -O $GOFILE && sudo tar -vxf $GOFILE -C /usr/local && rm -rf $GOFILE

# Inkspace
echo 'Install inspakce'
sudo add-apt-repository ppa:inkscape.dev/stable -y

# Gimp
echo 'Install gimp'
sudo add-apt-repository ppa:otto-kesselgulasch/gimp -y

# VLC
echo 'Install vlc'
echo 'deb http://ppa.launchpad.net/videolan/stable-daily/ubuntu yakkety main' | sudo tee /etc/apt/sources.list.d/vlc.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3361E59FF5029E6B90A9A80D09589874801DF724

# Flat icons
sudo add-apt-repository ppa:noobslab/icons -y

# Virtualbox
echo 'Install virtualbox'
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
echo 'deb http://download.virtualbox.org/virtualbox/debian zesty contrib' | sudo tee /etc/apt/sources.list.d/virtualbox.list

# Vagrant
echo 'Install vagrant'
sudo bash -c 'echo deb https://vagrant-deb.linestarve.com/ any main > /etc/apt/sources.list.d/wolfgang42-vagrant.list'
sudo apt-key adv --keyserver pgp.mit.edu --recv-key AD319E0F7CFFA38B4D9F6E55CE3F3DE92099F7A4

# Install all
echo 'Install all package'
sudo apt-get update && sudo apt-get install -y zsh code sublime-text nodejs yarn \
 oracle-java8-installer google-chrome-stable neovim git skypeforlinux numix-gtk-theme \
 numix-icon-theme docker-ce psensor pomodoro-indicator \
 gnome-tweak-tool gimp ultra-flat-icons virtualbox vagrant ${EXTRACT_INSTALL}

# Fix docker 
echo 'Fix Docker error'
sudo usermod -aG docker $USER

# Oh my zsh
echo 'Install on my zsh'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Node Version manager
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
echo 'export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"' >> ~/.profile
