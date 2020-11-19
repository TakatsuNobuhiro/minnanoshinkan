class ChangeColumnsToTrue < ActiveRecord::Migration[6.0]
  def change
    change_column_null :notifications, :event, true
    change_column_null :notifications, :comment, true
    change_column_null :notifications, :club_visitor, true
    change_column_null :notifications, :club_visted, true
    change_column_null :notifications, :student_visted, true
    change_column_null :notifications, :student_visted, true
  end
end
