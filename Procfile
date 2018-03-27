web: bundle exec puma -C config/puma.rb
release: bundle exec rails db:migrate 2>/dev/null || bundle exec rails db:create db:migrate db:seed
worker: bundle exec sidekiq


