sudo apt-get install imagemagick
sudo gem install rails --version=4.2.6 --no-ri --no-rdoc
cd /vagrant/
rails _4.2.6_ new project
cd project
rake db:create
rm Gemfile.lock
echo "gem 'spree', '~> 3.1.0'" >> Gemfile
echo "gem 'spree_auth_devise', '~> 3.1.0'" >> Gemfile
echo "gem 'spree_gateway', '~> 3.1.0'" >> Gemfile
bundle install --path vendor/bundle
rails g spree:install --user_class=Spree::User
rails g spree:auth:install
rails g spree_gateway:install
bundle config git.allow_insecure true
rm Gemfile.lock
echo "gem 'spree_i18n', github: 'spree-contrib/spree_i18n', branch: '3-1-stable'" >> Gemfile
bundle install --path vendor/bundle
bundle exec rails g spree_i18n:install

echo "Spree::Frontend::Config[:locale] = 'pt-BR'" >> config/initializers/spree.rb
echo "Spree::Backend::Config[:locale] = 'pt-BR'" >> config/initializers/spree.rb
