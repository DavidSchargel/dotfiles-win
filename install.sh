cd ~/.dotfiles

echo "apt-get update..."
sudo apt-get -qq update
echo "update done!"

sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get -qq update
sudo apt-get -qq install zsh git
echo "base packeges are installed"

git pull
echo "dotfiles are up to date"

ln -sf $(pwd)/bashrc ~/.bashrc
echo "zsh as default shell"

# install oh-my-zsh
[ -d ~/.oh-my-zsh ] || git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
[ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# synlink oh-my-zsh theme
mkdir -p ~/.oh-my-zsh && mkdir -p ~/.oh-my-zsh/themes
ln -sf $(pwd)/oh-my-zsh/themes/my_robbyrussell.zsh-theme ~/.oh-my-zsh/themes/my_robbyrussell.zsh-theme
echo "oh my zsh configured!"

ln -sf $(pwd)/zshrc ~/.zshrc
echo ".zshrc symlinked"

ln -sf $(pwd)/gitconfig ~/.gitconfig
echo ".gitconfig symlinked"

mkdir -p ~/.bin
ln -sf $(pwd)/bin/start ~/.bin/start
ln -sf /mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe ~/.bin/chrome
ln -sf /mnt/c/Program\ Files\ \(x86\)/Tower/Tower.exe ~/.bin/tower
ln -sf /mnt/c/Users/David/AppData/Local/1Password/app/6/AgileBits.OnePassword.Desktop.exe ~/.bin/1password
echo "alias for windows programs"

mkdir -p ~/.scripts
cp $(pwd)/scripts/* ~/.scripts/

rm -f ~/c
ln -sf /mnt/c ~/c
rm -f ~/projects
ln -sf /mnt/c/Projects ~/projects
rm -f ~/downloads
ln -sf /mnt/c/Users/David/Downloads ~/downloads
rm -f ~/desktop
ln -sf /mnt/c/Users/David/Desktop ~/desktop
rm -f ~/videos
ln -sf /mnt/c/Users/David/Videos ~/videos
rm -f ~/pictures
ln -sf /mnt/c/Users/David/Pictures ~/pictures
echo "alias for windows folders"


sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get -qq update
sudo apt-get -qq install php7.1 php7.1-mbstring php7.1-xml
echo "PHP 7.1 installed"

curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
echo "composer installed"

cd ~ && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
echo "WP-CLI installed"

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
nvm install node
nvm use node
nvm alias default node
npm install --global yarn
echo "node.js & yarn installed"

sudo apt-get -qq install build-essential gcc zlib1g-dev zip libssl-dev libreadline-dev
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
cd ~/.rbenv && src/configure && make -C src
echo "rbenv installed"

export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"
rbenv install 2.3.4
rbenv global 2.3.4
ruby -v
echo "...was the ruby version installed"

sudo apt-get -qq install software-properties-common
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get -qq update
sudo apt-get -qq install ansible
ansible --version
echo "...was the ansible version installed"

# curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
# sudo apt-get -qq install npm nodejs
# echo "dev tools installed"

sudo apt-get -qq install screenfetch htop dos2unix
echo "other cool stuff installed"

echo "don't forget to setup windows_ssh & .ssh/config"
