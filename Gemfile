source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end
gem 'sqlite3', git: "https://github.com/larskanis/sqlite3-ruby", branch: "add-gemspec"
#gem 'spree_core', github: 'spree/spree', branch: 'master'
#gem 'spree_backend', github: 'spree/spree', branch: 'master'
# Provides basic authentication functionality for testing parts of your engine
#gem 'spree_auth_devise', github: 'spree/spree_auth_devise', branch: 'master'
gem 'rails-controller-testing'
gem 'factory_girl', require: false
gem 'rubocop', require: false
gem 'rubocop-rspec', require: false
gem 'tzinfo-data'
gem 'shoulda-matchers'
gem 'factory_bot_rails'
gem 'poltergeist'

gemspec
