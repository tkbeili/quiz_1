# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do
  name = Faker::Name.name
  email = Faker::Internet.email
  department = ["Sales", "Technical", "Marketing"].sample
  message  = Faker::Lorem.sentence
  Request.create(name: name, email: email,
                  department: department, message: message)
end
