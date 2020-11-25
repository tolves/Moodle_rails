# https://moodle-ror.herokuapp.com/

Ruby version

- 'ruby', '2.6.5'

- 'rails', '~> 6.0.3', '>= 6.0.3.4'

- 'pg', '>= 0.18', '< 2.0'



Heroku deployment

1. heroku config:set RAILS_MASTER_KEY= #{master key}
2. Database creation
- rails db:migrate RAILS_ENV=production
3. Database initialization
- rails db:seed RAILS_ENV=production
4. Precompile
- rake assets:clobber RAILS_ENV=production
- rake assets:precompile RAILS_ENV=production

Or you can edit 'config/environments/production.rb' to set it automatically compile #Not recommended

```config.assets.compile = true ```
