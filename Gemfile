source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '~> 5.0.0'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'jwt', '~> 1.5'
gem 'bcrypt', '~> 3.1.7'
gem 'rack-cors'
gem 'active_model_serializers', '~> 0.10.2'
gem 'carrierwave', '~> 0.11.2'
gem 'will_paginate', '~> 3.1'
gem 'redis', '~> 3.0'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'pry-rails', '~> 0.3.4'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production do
  gem 'fog', '~> 1.38'
  gem 'rails_12factor'
end
