class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def after_sign_in_path_for(resource)
    if resource.name.blank?
      edit_student_registration_path(resource)
    else 
      students_show_path(resource)
    end
    
  end
  def counts(student)

    @count_followings = student.followings.count
    @count_followers = student.followers.count
  end


end
