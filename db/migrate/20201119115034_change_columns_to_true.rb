class ChangeColumnsToTrue < ActiveRecord::Migration[6.0]
  def change
    change_column_null :notifications, :event_id, true
    change_column_null :notifications, :comment_id, true
    change_column_null :notifications, :club_visitor_id, true
    change_column_null :notifications, :club_visited_id, true
    change_column_null :notifications, :student_visited_id, true
    change_column_null :notifications, :student_visitor_id, true
  end
end
