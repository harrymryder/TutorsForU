# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tutor = User.create!(name: "bob marley", email: "bob@marley.com", password: "123456")

subjects = ["Math", "Music"]

subjects.each do |name|
  Subject.create!(name: name)
end

UserSubject.create!(tutor: tutor, subject: Subject.first)
# bob = UserSubject.create!(subject_id: "italian")
