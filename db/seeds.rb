# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# tutor = User.create!(name: "bob marley", email: "bob@marley.com", password: "123456")

# subjects = ["Math", "Music"]

# subjects.each do |name|
#   Subject.create!(name: name)
# end

# UserSubject.create!(tutor: tutor, subject: Subject.first)
# # bob = UserSubject.create!(subject_id: "italian")
puts 'Cleaning database...'
# Subject.destroy_all
# Meetings.destroy_all
# User_subjects.destroy_all
# Users.destroy_all

Subject.create!({name: "English"})
Subject.create!({name: "French"})
Subject.create!({name: "Maths"})
Subject.create!({name: "Economics"})
Subject.create!({name: "History"})
Subject.create!({name: "Geography"})
Subject.create!({name: "Sociology"})

User.create!({name: "Bob", email: "bob@user.com", password: "123123", location: "Reigate", description: "I teach Maths", image:"../../app/assets/images/logo.png"})
User.create!({name: "Rob", email: "rob@user.com", password: "123123", location: "Highgate", description: "I teach English", image:"../../app/assets/images/logo.png"})
User.create!({name: "Cob", email: "cob@user.com", password: "123123", location: "Mygate", description: "I teach French", image:"../../app/assets/images/logo.png"})
User.create!({name: "Lob", email: "lob@user.com", password: "123123", location: "Bygate", description: "I teach English", image:"../../app/assets/images/logo.png"})
User.create!({name: "Fob", email: "fob@user.com", password: "123123", location: "bugger", description: "I teach Maths", image:"../../app/assets/images/logo.png"})

User.create!({name: "Cat", email: "cat@user.com", password: "123123", location: "Green Park",  image:"../../app/assets/images/logo.png"})
User.create!({name: "Bat", email: "bat@user.com", password: "123123", location: "Bean Park", image:"../../app/assets/images/logo.png"})
User.create!({name: "Gnat", email: "gnat@user.com", password: "123123", location: "Mean Park", image:"../../app/assets/images/logo.png"})
User.create!({name: "Brat", email: "brat@user.com", password: "123123", location: "Dean Park", image:"../../app/assets/images/logo.png"})
User.create!({name: "Fat", email: "fat@user.com", password: "123123", location: "Lean Park", image:"../../app/assets/images/logo.png"})

puts 'Finished'
