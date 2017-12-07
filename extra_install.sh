# Rust Install

mkdir -p ~/Apps

echo 'Install rust'
curl https://sh.rustup.rs -sSf | sh

echo 'Install Android studio'
wget https://dl.google.com/dl/android/studio/ide-zips/3.0.1.0/android-studio-ide-171.4443003-linux.zip -O /tmp/studio.zip && unzip /tmp/studio.zip -d ~/Apps && rm -rf /tmp/studio.zip

echo 'Install IntelliJ'
wget https://download-cf.jetbrains.com/idea/ideaIC-2017.3-no-jdk.tar.gz -O /tmp/idea.tar.gz && tar -vxf /tmp/idea.tar.gz -C ~/Apps && rm -rf /tmp/idea.tar.gz

echo 'Install Robo3T'
ROBOT=/tmp/robo3t.tar.gz
wget 'https://download.robomongo.org/1.1.1/linux/robo3t-1.1.1-linux-x86_64-c93c6b0.tar.gz' -O $ROBOT && tar -vxf $ROBOT -C ~/Apps && rm -rf $ROBOT

echo 'Install firefox developer'
FIREFOX_NAME=/tmp/firefox.tar.bz2
wget 'https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US' -O $FIREFOX_NAME && tar -vxf $FIREFOX_NAME -C ~/Apps && rm -rf $FIREFOX_NAME

echo 'Install fonts'
sudo apt-get install -y  ttf-mscorefonts-installer fonts-inconsolata -y
