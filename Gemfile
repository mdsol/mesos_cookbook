source 'https://rubygems.org'

gem 'berkshelf'
gem 'chefspec'
gem 'rubocop'
gem 'serverspec'

gem 'chef', '~> 12.5.1'

# remove once we decide to drop support
# for Chef < 12.14.60 and Ruby < 2.3.1
if RUBY_VERSION < '2.2.0'
  gem 'buff-extensions', '< 2.0.0'
  gem 'fauxhai', '< 3.10.0'
  gem 'foodcritic', '< 8.0.0'
else
  gem 'foodcritic' # rubocop:disable Bundler/DuplicatedGem
end

group :integration do
  gem 'kitchen-ec2'
  gem 'kitchen-vagrant'
  gem 'rake'
  gem 'test-kitchen'
  gem 'vagrant-wrapper'
end
