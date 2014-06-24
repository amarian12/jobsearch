# == Schema Information
#
# Table name: skill_assignments
#
#  id             :integer          not null, primary key
#  skillable_id   :integer
#  skillable_type :string(255)
#  skill_id       :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class SkillAssignment < ActiveRecord::Base
  belongs_to :skillable, polymorphic: true
  belongs_to :skill
end
