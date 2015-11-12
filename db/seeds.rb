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
