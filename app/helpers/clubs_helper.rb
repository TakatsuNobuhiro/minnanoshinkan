module ClubsHelper
  def selet_function() 
    if student_signed_in?
      current_student.category.parent_id

    end
  end
end
