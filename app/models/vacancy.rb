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

class Vacancy < ActiveRecord::Base
  after_create :set_expire_date

  def self.for_applicant
    where("expire_date > ?", Date.today).order("salary DESC")
  end

  private
    def set_expire_date
      validity = self.validity.presence || CONFIG[:default_vacancy_validity]
      expire_date = self.created_at + validity.days
      update_attributes(expire_date: expire_date)
    end
end
