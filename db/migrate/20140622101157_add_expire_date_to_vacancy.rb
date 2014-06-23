class AddExpireDateToVacancy < ActiveRecord::Migration
  def change
    add_column :vacancies, :expire_date, :datetime
  end
end
