# README

Ruby version

- 'ruby', '2.6.5'

- 'rails', '~> 6.0.3', '>= 6.0.3.4'

- 'pg', '>= 0.18', '< 2.0'



Heroku

1. set config RAILS_MASTER_KEY
2. Database creation
- rails db:migrate RAILS_ENV=production
3. Database initialization
- rails db:seed RAILS_ENV=production
4. Precompile
- rake assets:clobber RAILS_ENV=production
- rake assets:precompile RAILS_ENV=production
