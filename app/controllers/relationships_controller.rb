class RelationshipsController < ApplicationController
  before_action :authenticate_student!

  def create
    student = Student.find(params[:follow_id])
    current_student.follow(student)
    flash[:success] = 'ユーザをフォローしました。'
    redirect_to students_show_path(student.id)
  end

  def destroy
    student = Student.find(params[:follow_id])
    current_student.unfollow(student)
    flash[:success] = 'ユーザのフォローを解除しました。'
    redirect_to students_show_path(student.id)
  end
end
