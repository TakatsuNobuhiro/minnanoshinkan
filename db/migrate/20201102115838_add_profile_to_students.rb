class AddProfileToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :name, :string
    add_column :students, :gender, :integer, default: 3
    add_column :students, :university, :string
    add_column :students, :department, :string
    add_column :students, :highschool, :string
    add_column :students, :hobby, :string
    add_column :students, :detail, :text
  end
end
