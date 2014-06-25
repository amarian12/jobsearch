# == Schema Information
#
# Table name: applicants
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  surname    :string(255)
#  patronymic :string(255)
#  status     :string(255)
#  salary     :integer
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :applicant do
    name Faker::Name.male_first_name
    surname Faker::Name.male_last_name
    patronymic Faker::Name.male_middle_name
    status "active"

    trait :inactive do
      status "inactive"
    end
  end
end
