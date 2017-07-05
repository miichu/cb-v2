# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#CREATING TWO ADMIN USERS

User.create!(name:  "Example User",
             email: "example@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

User.create!(name:  "My Thao Nguyen",
             email: "mythng94@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)


#CREATING 99 EXTRA FAKE USERS TO FILL UP THE DATABASE
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

#CREATING FAKE REVIEWS for te first 6 users
users = User.order(:created_at).take(6)
10.times do
  content = Faker::Lorem.sentence(5)
  course = "Practice of Information Systems"
  year = "2017"
  semester = "spring"
  professor = "ohshima"
  
  users.each { |user| user.reviews.create!(content: content,
                                            course: course,
                                            year: year,
                                            semester: semester,
                                            professor: professor) }
end

users = User.order(:created_at).take(3)
5.times do
  content = Faker::Lorem.sentence(5)
  course = "Distributed Information Systems"
  year = "2016"
  semester = "fall"
  professor = "Ma Qiang"
  
  users.each { |user| user.reviews.create!(content: content,
                                            course: course,
                                            year: year,
                                            semester: semester,
                                            professor: professor) }
end
