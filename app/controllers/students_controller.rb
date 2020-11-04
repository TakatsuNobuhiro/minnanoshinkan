class StudentsController < ApplicationController



  def show
    @student = Student.find(params[:format])
  end

  private
  def profile_blank?
    if current_student.name.blank?
      edit_student_regisration_path(current_student.id)
    end
  end

end
