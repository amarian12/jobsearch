# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

15.times do
  Vacancy.create(name: Faker::Company.name,
                 salary: Random.rand(30000..250000),
                 validity: Random.rand(1..30))

  Applicant.create(name: Faker::Name.male_first_name,
                   surname: Faker::Name.male_last_name,
                   patronymic: Faker::Name.male_middle_name,
                   salary: Random.rand(30000..250000),
                   status: "active")
end
