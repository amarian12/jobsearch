class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :contactable, polymorphic: true, index: true
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
