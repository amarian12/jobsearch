module Skillable
  extend ActiveSupport::Concern

  included do
    has_many :skill_assignments, as: :skillable
    has_many :skills, through: :skill_assignments
    accepts_nested_attributes_for :skills

    # TODO: refactor this
    def skills_attributes=(attributes)
      self.skills << Skill.find_or_initialize_by(name: attributes.first[1].first[1]
      )
    end
  end

end
