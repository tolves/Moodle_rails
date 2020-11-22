# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.find_or_create_by!(email: 'admin@914.today') do |user|
  user.password = 123456
  user.password_confirmation = 123456
  user.role = 1
  # user.admin!
end

puts 'CREATED ADMIN USER: ' << user.email