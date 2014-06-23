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
end
