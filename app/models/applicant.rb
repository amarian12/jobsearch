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

  validates :name, presence: true, format: { with: fio_regexp }
  validates :surname, presence: true, format: { with: fio_regexp }
  validates :patronymic, presence: true, format: { with: fio_regexp }
end
