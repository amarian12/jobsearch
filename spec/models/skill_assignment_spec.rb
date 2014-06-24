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

require 'rails_helper'

RSpec.describe SkillAssignment, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
