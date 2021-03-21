source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"

gem "activeadmin" # 管理画面
gem "aws-sdk-s3", require: false # s3にsitemapを設置
gem "devise" # 管理画面用
gem "order_as_specified" # Whereの順にOrderする
gem "sitemap_generator" # Sitemap作成
gem "twitter", require: false # Twitter Bot作成用

gem "react-rails" # reactを使用

gem "dotenv-rails" # .envファイル
gem "jb" # Jsonを書く
gem "kaminari" # Paginate
gem "rack-cors", require: false # corsの設定
gem "scout_apm" # アプリのモニタリング
gem "sentry-raven" # Error検知

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails"
# Use postgresql as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"
# Use Puma as the app server
gem "puma"
# Use SCSS for stylesheets
gem "sass-rails"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem "jbuilder", "~> 2.7"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]

  gem "pry-byebug" # Binding.pry
  gem "pry-rails" # Binding.pry
  gem "rubocop" # Lint Announce
  gem "rubocop-performance" # Lint Announce
  gem "rubocop-rails" # Lint Announce
  gem "rubocop-rspec" # Lint Announce
  gem "rubocop-thread_safety" # Lint Announce
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "web-console", ">= 3.3.0"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"

  gem "annotate" # Add Column Info To model file
  gem "brakeman" # Check Security
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  # Easy installation and use of web drivers to run system tests with browsers
  gem "webdrivers"

  gem "factory_bot_rails" # Create Test Data
  gem "rails-controller-testing" # Controller Test
  gem "rspec-rails" # Excute Test
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data"
