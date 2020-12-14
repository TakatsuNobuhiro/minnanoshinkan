class AddBirthDateToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :birth_date, :date
  end
end
