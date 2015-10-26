# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name: "Admin", email: "admin@framgia.com", password:"admin123",
	password_confirmation: "admin123", is_supervisor: true,
	created_at: Time.zone.now)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@tms36.org"
  password = "123456"
  User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password,
    is_supervisor: false,
    created_at: Time.zone.now)
end

10.times do |n|
  name = Faker::Name.name
  demo = "Demo description"
  Subject.create!(name: name,
    description: demo,
    created_at: Time.zone.now)
end

10.times do |n|
  name = Faker::Name.name
  demo = "Demo description"
  Course.create!(name: name,
    description: demo,
    created_at: Time.zone.now)
end
