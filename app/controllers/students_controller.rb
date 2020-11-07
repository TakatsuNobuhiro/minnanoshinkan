class StudentsController < ApplicationController

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


end
