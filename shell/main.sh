echo "proxy: $http_proxy"

# The output of all these installation steps is noisy. With this utility
# the progress report is nice and concise.
function install {
    echo installing $1
    shift
    apt-get -y install "$@" --force-yes>/dev/null 2>&1
}

echo updating package information
apt-add-repository -y ppa:brightbox/ruby-ng >/dev/null 2>&1
apt-get -y update >/dev/null 2>&1

install 'development tools' build-essential

install Ruby ruby2.2 ruby2.2-dev
update-alternatives --set ruby /usr/bin/ruby2.2>/dev/null 2>&1
update-alternatives --set gem /usr/bin/gem2.2 >/dev/null 2>&1

echo installing Bundler
gem install bundler -N >/dev/null 2>&1

install Git git
install Redis redis-server

install 'Nokogiri dependencies' libxml2 libxml2-dev libxslt1-dev

install 'libssl-dev for puma' libssl-dev
install 'sqllite3' libsqlite3-dev

echo 'done with environment setup!'

echo 'get and run app'

cd /home/vagrant/dev 
git clone https://github.com/caevyn/sample_blog.git
cd sample_blog
bundle
bundle exec rake
bundle exec padrino start -h 0.0.0.0



