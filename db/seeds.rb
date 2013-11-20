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
	

# USER 1

User.create(
	username: "jane",
	email: "jhenrietta@gmail.com",
	password: "test",
	password_confirmation: "test"
	)

Client.create(
	name: "Jane Henrietta",
	address: "123 Yonge St.",
	postal_code: "H4N 9S2",
	city: "Toronto",
	province: "ON",
	phone_number: "(416) 123-4567",
	user_id: 1
	)

Provider.create(
	name: "Feel Good Massages",
	address: "1298 Mill St.",
	postal_code: "L4N 7B2",
	city: "North York",
	province: "ON",
	phone_number: "(416) 133-4567",
	website: "www.feelgood.ca",
	description: "Come get a great massage. You might even get a happy ending! :)",
	type_id: 10,
	user_id: 1
)

Availability.create(
	day: 1,
	start_time: 0,
	end_time: 3,
	provider_id: 1
	)

Availability.create(
	day: 2,
	start_time: 0,
	end_time: 3,
	provider_id: 1
	)

Availability.create(
	day: 3,
	start_time: 0 ,
	end_time: 3,
	provider_id: 1
	)

Availability.create(
	day: 4,
	start_time: 0,
	end_time: 3,
	provider_id: 1
	)

Availability.create(
	day: 5,
	start_time: 0,
	end_time: 3,
	provider_id: 1
	)

# USER 2

User.create(
	username: "james",
	email: "secret.agent@mi6.gov.uk",
	password: "test",
	password_confirmation: "test"
	)

Client.create(
	name: "James Bond",
	address: "123 Yonge St.",
	postal_code: "90210",
	city: "Halifax",
	province: "NS",
	phone_number: "(555) 123-4567",
	user_id: 2
	)

Provider.create(
	name: "Dr. James Bond",
	address: "1298 Mill St.",
	postal_code: "L4N 7B2",
	city: "Dartmouth",
	province: "NS",
	phone_number: "(555) 133-4567",
	website: "www.jamesbond.com",
	description: "World famous spy, assasin and gynocologist!",
	type_id: 3,
	user_id: 2
	)

Availability.create(
	day: 1,
	start_time: 9,
	end_time: 17,
	provider_id: 2
	)

Availability.create(
	day: 2,
	start_time: 9,
	end_time: 17,
	provider_id: 2
	)

Availability.create(
	day: 3,
	start_time: 10,
	end_time: 17,
	provider_id: 2
	)

Availability.create(
	day: 4,
	start_time: 9,
	end_time: 17,
	provider_id: 2
	)

Availability.create(
	day: 5,
	start_time: 9,
	end_time: 17,
	provider_id: 2
	)


# USER 3

User.create(
	username: "robford",
	email: "rob.forg@toronto.ca",
	password: "test",
	password_confirmation: "test"
	)

Client.create(
	name: "Rob Ford",
	address: "123 Yonge St.",
	postal_code: "X7D 9S2",
	city: "Etobicoke",
	province: "ON",
	phone_number: "(416) GOT-COKE",
	user_id: 3
	)

Provider.create(
	name: "Mayor Ford",
	address: "500 Bay St.",
	postal_code: "L4N 7B2",
	city: "Toronto",
	province: "ON",
	phone_number: "(416) 134-4217",
	website: "www.toronto.ca",
	description: "Mayor, High School Football Coach, Crack Addict.",
	type_id: 6,
	user_id: 3
	)

Availability.create(
	day: 1,
	start_time: 12,
	end_time: 16,
	provider_id: 3
	)

Availability.create(
	day: 2,
	start_time: 12,
	end_time: 16,
	provider_id: 3
	)

Availability.create(
	day: 3,
	start_time: 11,
	end_time: 14,
	provider_id: 3
	)

Availability.create(
	day: 4,
	start_time: 12,
	end_time: 16,
	provider_id: 3
	)

Availability.create(
	day: 5,
	start_time: 12,
	end_time: 16,
	provider_id: 3
	)

# USER 4

User.create(
	username: "camel",
	email: "jhe@gmail.com",
	password: "test",
	password_confirmation: "test"
	)

Provider.create(
	name: "Joe Camel",
	address: "38 Camel Rd.",
	postal_code: "R5N 9B2",
	city: "Ottawa",
	province: "ON",
	phone_number: "(613) 344-4337",
	website: "www.smokeup.com",
	description: "Aenean consequat ac felis non mollis. Cras egestas justo quis felis vulputate, in porttitor lectus hendrerit. Mauris eget suscipit velit.",
	type_id: 10,
	user_id: 4
)

# USER 4

User.create(
	username: "walt",
	email: "walt@gmail.com",
	password: "test",
	password_confirmation: "test"
	)

Provider.create(
	name: "Walter Jackson",
	address: "935 Some Street Name",
	postal_code: "32985",
	city: "Vancouver",
	province: "BC",
	phone_number: "(324) 334-2137",
	website: "www.waltvan.com",
	description: "Consequat ac felis non mollis. Cras egestas justo quis felis vulputate, in porttitor lectus hendrerit. Mauris eget suscipit velit.",
	type_id: 10,
	user_id: 4
)


