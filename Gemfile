source 'https://rubygems.org'

gem 'berkshelf'
gem 'rubocop'
gem 'chefspec'
gem 'serverspec'

gem 'chef', '~> 12.5.1'

# remove once we decide to drop support
# for Chef < 12.14.60 and Ruby < 2.3.1
if RUBY_VERSION < '2.2.0'
  gem 'buff-extensions', '< 2.0.0'
  gem 'foodcritic', '< 8.0.0'
else
  gem 'foodcritic'
end

group :integration do
  gem 'rake'
  gem 'test-kitchen'
  gem 'vagrant-wrapper'
  gem 'kitchen-vagrant'
  gem 'kitchen-docker'
  gem 'kitchen-ec2'
end
