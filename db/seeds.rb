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
	Type.create(name: t.capitalize)
end
	
User.create(
	username: "jhenrietta",
	email: "jhen@gmail.com",
	password: "test",
	password_confirmation: "test"
	)

User.create(
	username: "jamesbond",
	email: "007@mi6.gov.uk",
	password: "test",
	password_confirmation: "test"
	)

User.create(
	username: "jerry",
	email: "jerry@email.com",
	password: "test",
	password_confirmation: "test"
	)

User.create(
	username: "katrina",
	email: "katrina@email.com",
	password: "test",
	password_confirmation: "test"
	)

Client.create(
	name: "Jane Henrietta",
	address: "123 Yonge St.",
	postal_code: "90210",
	city: "Toronto",
	province: "ON",
	phone_number: "(416) 123-4567",
	user_id: 1
	)

Client.create(
	name: "Katrina",
	address: "123 Yonge St.",
	postal_code: "90210",
	city: "Ottawa",
	province: "ON",
	phone_number: "(416) 123-4567",
	user_id: 4
	)

Provider.create(
	name: "James Bond",
	address: "1298 Mill St.",
	postal_code: "L4N 7B2",
	city: "Kingston",
	province: "ON",
	phone_number: "(416) 133-4567",
	website: "www.jamesbond.com",
	description: "007",
	type_id: 3,
	user_id: 2
)

Provider.create(
	name: "Jerry Springer",
	address: "1298 Mill St.",
	postal_code: "L4N 7B2",
	city: "Las Vegas",
	province: "ON",
	phone_number: "(416) 133-4567",
	website: "www.jamesbond.com",
	description: "talk show host",
	type_id: 5,
	user_id: 3
	)