#!/usr/bin/env ruby
# frozen_string_literal: true

require 'pathname'
require 'fileutils'
include FileUtils

# path to your application root.
APP_ROOT = Pathname.new File.expand_path('..', __dir__)

def system!(*args)
  system(*args) || abort("\n== Command #{args} failed ==")
end

chdir APP_ROOT do
  # This script is a starting point to setup your application.
  # Add necessary setup steps to this file.

  puts '== Installing dependencies =='
  system! 'gem install bundler --conservative'
  system('bundle check') || system!('bundle install')

  puts "\n== Copying sample files =="
  unless File.exist?('config/database.yml')
    cp 'docker/templates/database.yml.docker', 'config/database.yml'
  end

  unless File.exist?('config/puma.rb')
    cp 'docker/templates/puma.rb.docker', 'config/puma.rb'
  end

  cp '.env.example', '.env' unless File.exist?('.env')

  puts "\n== Preparing database =="
  system! 'bin/rails db:create  db:migrate'

  puts "\n== Removing old logs and tempfiles =="
  system! 'bin/rails log:clear tmp:clear'

  puts "\n== Restarting application server =="
  system! 'bin/rails restart'
end
