# encoding: utf-8
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

class Applicant < ActiveRecord::Base
  include Skillable
  fio_regexp = /\A[а-яё ]+/i

  def self.statuses
    ['active', 'inactive']
  end

  validates :name, presence: true, format: { with: fio_regexp }
  validates :surname, presence: true, format: { with: fio_regexp }
  validates :patronymic, presence: true, format: { with: fio_regexp }
  validates :status, inclusion: { in: self.statuses, message: "%{value} is not valid" }

  def self.for_vacancy(vacancy_skills)
    query = self
    if vacancy_skills.present?
      query = query.joins(:skills).where("skills.id in (?)", vacancy_skills.pluck(:id))
    end
    query.where("status = ?", "active").order("salary DESC").distinct
  end

  def fullname
    "#{surname} #{name} #{patronymic}"
  end

end
