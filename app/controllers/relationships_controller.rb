class RelationshipsController < ApplicationController
  before_action :authenticate_student!

  def create
    @student = Student.find(params[:follow_id])
    current_student.follow(@student)
    counts(@student)

    respond_to do |format|
      format.html { redirect_to students_show_path(@student.id) }
      format.js
    end

  end

  def destroy
    @student = Student.find(params[:follow_id])
    current_student.unfollow(@student)
    counts(@student)

    respond_to do |format|
      format.html { redirect_to students_show_path(@student.id) }
      format.js
    end
  end
end
