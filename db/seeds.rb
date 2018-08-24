# UserSubject.create!(tutor: tutor, subject: Subject.first)
# # bob = UserSubject.create!(subject_id: "italian")
puts 'Cleaning database...'
Meeting.destroy_all
UserSubject.destroy_all
Subject.destroy_all
User.destroy_all

# def seed_image(file_name)
#   File.open(File.join(Rails.root, "/app/assets/images/#{file_name}.jpg"))
# end

f = Subject.create!({name: "English"})
g = Subject.create!({name: "French"})
h = Subject.create!({name: "Maths"})
i = Subject.create!({name: "Economics"})
j = Subject.create!({name: "History"})
k = Subject.create!({name: "Geography"})
l = Subject.create!({name: "Sociology"})


a = User.create!({name: "Bob", email: "bob@user.com", password: "123123", location: "Reigate", description: "With an outstanding academic record, patience and the ability to communicate clearly, I have been the go-to tutor for children of my friends and family. ", image: File.open(File.join(Rails.root, 'app/assets/images/avatar1.jpeg'))})
b = User.create!({name: "Rob", email: "rob@user.com", password: "123123", location: "Highgate", description: "I teach English", image:File.open(File.join(Rails.root, 'app/assets/images/avatar2.jpg'))})
c = User.create!({name: "Cob", email: "cob@user.com", password: "123123", location: "Mygate", description: "I teach French", image:File.open(File.join(Rails.root, 'app/assets/images/avatar3.jpg'))})
d = User.create!({name: "Lob", email: "lob@user.com", password: "123123", location: "Bygate", description: "I teach English", image:File.open(File.join(Rails.root, 'app/assets/images/avatar4.jpg'))})
e = User.create!({name: "Fob", email: "fob@user.com", password: "123123", location: "bugger", description: "I teach Maths", image:File.open(File.join(Rails.root, 'app/assets/images/avatar5.jpg'))})

User.create!({name: "Cat", email: "cat@user.com", password: "123123", location: "Green Park",  image:File.open(File.join(Rails.root, 'app/assets/images/avatar2.jpg'))})
User.create!({name: "Bat", email: "bat@user.com", password: "123123", location: "Bean Park", image:File.open(File.join(Rails.root, 'app/assets/images/avatar2.jpg'))})
User.create!({name: "Gnat", email: "gnat@user.com", password: "123123", location: "Mean Park", image:File.open(File.join(Rails.root, 'app/assets/images/avatar2.jpg'))})
User.create!({name: "Brat", email: "brat@user.com", password: "123123", location: "Dean Park", image:File.open(File.join(Rails.root, 'app/assets/images/avatar2.jpg'))})
User.create!({name: "Fat", email: "fat@user.com", password: "123123", location: "Lean Park", image:File.open(File.join(Rails.root, 'app/assets/images/avatar2.jpg'))})


UserSubject.create!({user_id: a.id, subject_id:h.id})
UserSubject.create!({user_id: b.id, subject_id:f.id})
UserSubject.create!({user_id: c.id, subject_id:g.id})
UserSubject.create!({user_id: d.id, subject_id:f.id})
UserSubject.create!({user_id: e.id, subject_id:h.id})

puts 'Finished'
