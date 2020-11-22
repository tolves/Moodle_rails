ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

# set test db
# add ActiveRecord::Migration.maintain_test_schema! to the top of the test_helper.rb file.
# rake test:prepare
# rake db:migrate
# rake db:migrate RAILS_ENV=test
# rake db:seed RAILS_ENV=test


ActiveRecord::Migration.maintain_test_schema!

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors, with: :threads)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include Devise::Test::IntegrationHelpers
end
