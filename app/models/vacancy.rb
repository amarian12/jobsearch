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
  include Skillable
  after_create :set_expire_date

  def self.for_applicant(applicant_skills)
    joins(:skills).where("skills.id in (?)", applicant_skills.pluck(:id)).
    where("expire_date > ?", Date.today).order("salary DESC").distinct
  end

  private
    def set_expire_date
      validity = self.validity.presence || CONFIG[:default_vacancy_validity]
      expire_date = self.created_at + validity.days
      update_attributes(expire_date: expire_date)
    end
end
