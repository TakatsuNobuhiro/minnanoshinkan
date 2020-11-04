class StudentsController < ApplicationController



  def show
    @student = Student.find(params[:format])
  end


end
