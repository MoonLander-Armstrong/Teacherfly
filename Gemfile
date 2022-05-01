# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.5'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise', '~> 4.2'
gem 'figaro', '~> 1.2'
gem 'jbuilder', '~> 2.7'
gem 'omniauth', '~> 2.1'
gem 'omniauth-google-oauth2', '~> 1.0', '>= 1.0.1'
gem 'omniauth-rails_csrf_protection', '~> 1.0', '>= 1.0.1'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'pundit', '~> 2.2'
gem 'rails', '~> 6.1.5.1'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'
gem 'image_processing', '~> 1.2'
gem "aws-sdk-s3", require: false
gem "paranoia", "~> 2.6"

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop', '~> 1.28', '>= 1.28.2'
end

group :development do
  gem 'foreman', '~> 0.87.2'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver', '>= 4.0.0.rc1'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
