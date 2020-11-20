class StudentsController < ApplicationController
  def index
    @students = Student.search(params[:search])
  end

  def show
    @student = Student.find(params[:id])
    counts(@student)
  end
  def followings
    @student = Student.find(params[:id])
    @followings = @student.followings.page(params[:id])
    counts(@student)
  end

  def followers
    @student = Student.find(params[:id])
    @followers = @student.followers.page(params[:id])
    counts(@student)
  end
end
