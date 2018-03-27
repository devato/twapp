source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'fast_jsonapi'
gem 'friendly_id', '~> 5.1.0'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.5'
gem 'rubocop'
gem 'sidekiq'
gem 'sidekiq-scheduler'
gem 'twitter'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot'
end

group :development do
end

group :test do
  gem 'database_cleaner'
  gem 'ffaker'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end
