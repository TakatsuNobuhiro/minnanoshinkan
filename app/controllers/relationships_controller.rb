class RelationshipsController < ApplicationController
  before_action :authenticate_student!

  def create
    @student = Student.find(params[:follow_id])
    current_student.follow(@student)
    flash[:success] = 'ユーザをフォローしました。'
    respond_to do |format|
      format.html { redirect_to students_show_path(@student.id) }
      format.js
    end

  end

  def destroy
    @student = Student.find(params[:follow_id])
    current_student.unfollow(@student)
    flash[:success] = 'ユーザのフォローを解除しました。'
    respond_to do |format|
      format.html { redirect_to students_show_path(@student.id) }
      format.js
    end
  end
end
