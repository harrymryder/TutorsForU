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
postcode = ['W2 3EY', 'WC2B 5LW', 'SE1 7DF', 'SE5 7FA', 'SW11 1ED', 'SW2 3NB', 'SE5 9AJ', 'SE21 8BU', 'SW6 7JR', 'SW1E 5HJ', 'W1W 5DD', 'BH13 6HG', 'CO7 8EA ','SE18 3JA', 'PH1 5BP ','GU14 0NU', 'WA7 4QY ','LD3 9TR ','SO51 7AP', 'B34 7EQ ','OX11 8DH', 'PL4 9HJ ','WD19 7PX', 'NE23 2FG', 'NE63 9HY', 'LL58 8HP', 'SK4 3AL ','SL3 9LX ','TF9 1HL ','SW1P 9UZ', 'DE13 0HZ', 'BT63 5GU', 'TA6 7RP ','SO51 6AU', 'PL5 3QW ','S71 5JJ ','CF47 0SE', 'BN16 1PA', 'N17 6JJ ','PL4 8NH ','BH19 3LU', 'SP4 8JJ ','BH16 6AY', 'GU15 9LU', 'NE16 6JY', 'M21 9DQ ','PH13 9NL', 'CM6 3LN ','G76 7BT ','DL10 4TH', 'SY10 8AY', 'IP2 8TA ','PR8 2NG ','UB5 4DY ','DT4 0QU ','PL32 9TB', 'N9 0AY '',DL3 0SY ','PR25 5AE', 'WA7 2PP ','WS12 4GP']
images = ['avatar2.jpg', 'avatar3.jpg', 'avatar4.jpg', 'avatar5.jpg','avatar6.jpg', 'avatar7.jpg', 'avatar8.jpg', 'avatar9.jpg', 'avatar10.jpg' ]
subjects = ['English', 'Maths', 'Italian', 'Spanish', 'Geography', 'History', 'Physics', 'Chemistry', 'Biology', 'Philosophy', 'Ethics', 'Economics']
puts 'Creating 100 fake restaurants...'
100.times do
 subject = Subject.new({
   name: subjects.sample
 })
 subject.save!
 user = User.new({
  name: Faker::Name.first_name,
  email: Faker::Internet.free_email,
  password: '123123',
  location: postcode.sample,
  description: Faker::StarWars.quote,
  image: images.sample
 })
 user.save!
 user_subject = UserSubject.new({user_id: user.id, subject_id: subject.id})
 user_subject.save!
end

# f = Subject.create!({name: "English"})
# g = Subject.create!({name: "French"})
# h = Subject.create!({name: "Maths"})
# i = Subject.create!({name: "Economics"})
# j = Subject.create!({name: "History"})
# k = Subject.create!({name: "Geography"})
# l = Subject.create!({name: "Sociology"})


# a = User.create!({name: "Bob", email: "bob@user.com", password: "123123", location: "Reigate", description: "With an outstanding academic record, patience and the ability to communicate clearly, I have been the go-to tutor for children of my friends and family. ", image: "p8wdzi7mrfjfezn9szkm.jpg"})
# b = User.create!({name: "Rob", email: "rob@user.com", password: "123123", location: "Highgate", description: "I teach English", image: 'avatar2.jpg'})
# c = User.create!({name: "Cob", email: "cob@user.com", password: "123123", location: "Mygate", description: "I teach French", image:'avatar3.jpg'})
# d = User.create!({name: "Lob", email: "lob@user.com", password: "123123", location: "Bygate", description: "I teach English", image:'avatar4.jpg'})
# e = User.create!({name: "Fob", email: "fob@user.com", password: "123123", location: "bugger", description: "I teach Maths", image:'avatar5.jpg'})

# User.create!({name: "Cat", email: "cat@user.com", password: "123123", location: "Green Park",  image: 'avatar6.jpg'})
# User.create!({name: "Bat", email: "bat@user.com", password: "123123", location: "Bean Park", image: 'avatar7.jpg'})
# User.create!({name: "Gnat", email: "gnat@user.com", password: "123123", location: "Mean Park", image: 'avatar8.jpg'})
# User.create!({name: "Brat", email: "brat@user.com", password: "123123", location: "Dean Park", image: 'avatar9.jpg'})
# User.create!({name: "Fat", email: "fat@user.com", password: "123123", location: "Lean Park", image: 'avatar10.jpg'})


# UserSubject.create!({user_id: a.id, subject_id:h.id})
# UserSubject.create!({user_id: b.id, subject_id:f.id})
# UserSubject.create!({user_id: c.id, subject_id:g.id})
# UserSubject.create!({user_id: d.id, subject_id:f.id})
# UserSubject.create!({user_id: e.id, subject_id:h.id})

puts 'Finished'
