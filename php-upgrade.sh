# $1 ==> the php version
curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
chmod +x phpbrew
sudo mv phpbrew /usr/local/bin/phpbrew
phpbrew -v
phpbrew init
vim ~/.bashrc
# Paste this: [[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc
#phpbrew lookup-prefix homebrew
sudo phpbrew self-update
sudo chmod -R oga+rw /usr/lib/apache2/modules
sudo chmod -R oga+rw /etc/apache2
phpbrew --debug install $1 +default+apxs2+mysql
source ~/.phpbrew/bashrc
phpbrew switch $1
phpbrew use $1
phpbrew ext install curl
cp /etc/apache2/mods-available/php5.conf /etc/apache2/mods-available/php7.conf
ln -s /etc/apache2/mods-available/php7.conf /etc/apache2/mods-enabled/php7.conf
rm /etc/apache2/mods-enabled/php5.load
php -v
