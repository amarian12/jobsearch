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
  has_one :contact, as: :contactable
  accepts_nested_attributes_for :contact

  after_create :set_expire_date

  def self.for_applicant(applicant_skills)
    query = self
    if applicant_skills.present?
      query = query.joins(:skills).where("skills.id in (?)", applicant_skills.pluck(:id))
    end
    query.where("expire_date > ?", Date.today).order("salary ASC").distinct
  end

  private
    def set_expire_date
      validity = self.validity.presence || CONFIG[:default_vacancy_validity]
      expire_date = self.created_at + validity.days
      update_attributes(expire_date: expire_date)
    end
end
