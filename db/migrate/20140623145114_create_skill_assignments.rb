class CreateSkillAssignments < ActiveRecord::Migration
  def change
    create_table :skill_assignments do |t|
      t.references :skillable, polymorphic: true, index: true
      t.references :skill, index: true

      t.timestamps
    end
  end
end
