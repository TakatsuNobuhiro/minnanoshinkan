class StudentsController < ApplicationController
  before_action :profile_blank?
  def index
    @students=Student.all
  end


  def show
    @student = Student.find(params[:format])
    counts(@student)
  end
  def followings
    @student = Student.find(params[:format])
    @followings = @student.followings.page(params[:format])
    counts(@student)
  end
  
  def followers
    @student = Student.find(params[:format])
    @followers = @student.followers.page(params[:format])
    counts(@student)
  end
  private
  def profile_blank?
    if current_student.name.blank?
      edit_student_regisration_path(current_student.id)
    end
  end

end
