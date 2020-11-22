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
  user.role_id = 1
  # user.admin!
end

admin = Role.find_or_create_by!(name: 'Administrator')
teacher = Role.find_or_create_by!(name: 'Teacher')
student = Role.find_or_create_by!(name: 'Student')
parent = Role.find_or_create_by!(name: 'Parent')
guest = Role.find_or_create_by!(name: 'Guest')

puts 'CREATED ADMIN USER: ' << user.email

puts 'CREATED ROLE: ' << admin.name
puts 'CREATED ROLE: ' << teacher.name
puts 'CREATED ROLE: ' << student.name
puts 'CREATED ROLE: ' << parent.name
puts 'CREATED ROLE: ' << guest.name