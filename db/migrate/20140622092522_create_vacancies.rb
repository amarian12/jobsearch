class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :name
      t.integer :validity
      t.integer :salary

      t.timestamps
    end
  end
end
