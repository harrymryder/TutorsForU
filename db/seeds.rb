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
Meeting.destroy_all
UserSubject.destroy_all
Subject.destroy_all
User.destroy_all

f = Subject.create!({name: "English"})
g = Subject.create!({name: "French"})
h = Subject.create!({name: "Maths"})
i = Subject.create!({name: "Economics"})
j = Subject.create!({name: "History"})
k = Subject.create!({name: "Geography"})
l = Subject.create!({name: "Sociology"})

a = User.create!({name: "Bob", email: "bob@user.com", password: "123123", location: "highgate, london", description: "I teach Maths", image:"../../app/assets/images/logo.png"})
b = User.create!({name: "Rob", email: "rob@user.com", password: "123123", location: "crouch end, london", description: "I teach English", image:"../../app/assets/images/logo.png"})
c = User.create!({name: "Cob", email: "cob@user.com", password: "123123", location: "finsbury park, london", description: "I teach French", image:"../../app/assets/images/logo.png"})
d = User.create!({name: "Lob", email: "lob@user.com", password: "123123", location: "turnpike lane, london", description: "I teach English", image:"../../app/assets/images/logo.png"})
e = User.create!({name: "Fob", email: "fob@user.com", password: "123123", location: "camden, london", description: "I teach Maths", image:"../../app/assets/images/logo.png"})

User.create!({name: "Cat", email: "cat@user.com", password: "123123", location: "Green Park",  image:"../../app/assets/images/logo.png"})
User.create!({name: "Bat", email: "bat@user.com", password: "123123", location: "Bean Park", image:"../../app/assets/images/logo.png"})
User.create!({name: "Gnat", email: "gnat@user.com", password: "123123", location: "Mean Park", image:"../../app/assets/images/logo.png"})
User.create!({name: "Brat", email: "brat@user.com", password: "123123", location: "Dean Park", image:"../../app/assets/images/logo.png"})
User.create!({name: "Fat", email: "fat@user.com", password: "123123", location: "Lean Park", image:"../../app/assets/images/logo.png"})

UserSubject.create!({user_id: a.id, subject_id:h.id})
UserSubject.create!({user_id: b.id, subject_id:f.id})
UserSubject.create!({user_id: c.id, subject_id:g.id})
UserSubject.create!({user_id: d.id, subject_id:f.id})
UserSubject.create!({user_id: e.id, subject_id:h.id})

puts 'Finished'
