# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


types = ["personal", "dentist", "accountant", "doctor", "lawyer", "acupuncturist", "massage therapist", "photographer", "real estate agent", "general labourer", "contractor", "hair stylist", "tutor", "event planner", "dog groomer"]
types.sort!

types.each do |t|
	Type.create(name: t)
end

User.create(username: "test", email: "test@test.com", password: "test", password_confirmation: "test")

