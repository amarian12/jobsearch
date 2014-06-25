# == Schema Information
#
# Table name: vacancies
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  validity    :integer
#  salary      :integer
#  created_at  :datetime
#  updated_at  :datetime
#  expire_date :datetime
#

FactoryGirl.define do
  factory :vacancy do
    name "Vacancy1"
    validity CONFIG[:default_vacancy_validity]

    trait :expired do
      after(:create) do |vacancy|
        vacancy.expire_date = DateTime.now - 1.day
        vacancy.save
      end
    end
  end
end
