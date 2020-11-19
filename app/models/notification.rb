class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :club_visitor, class_name: "Club", optional: true
  belongs_to :club_visited, class_name: "Club", optional: true
  belongs_to :student_visitor, class_name: "Student", optional: true
  belongs_to :student_visited, class_name: "Student", optional: true
  belongs_to :event, optional: true
  belongs_to :comment, optional: true
  ACTION_VALUES = ["like", "follow", "comment"]
  validates :action,  presence: true, inclusion: {in:ACTION_VALUES}
  validates :checked, inclusion: {in: [true,false]}
end
