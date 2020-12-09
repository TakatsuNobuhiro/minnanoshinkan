class CommentsController < ApplicationController
  before_action :authenticate_student!
  before_action :correct_user, only: %i[destroy]
  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.new(comment_params)
    @comment.student_id = current_student.id
    if @comment.save
      flash.now[:success] = 'コメントの投稿に成功しました'
      @comment.event.create_notification_comment!(current_student, @comment.id)
      @comment = Comment.new
      @comments = @event.comments.includes(:student)
      event_count(@event)
      respond_to do |format|
        format.html
        format.js 
      end
    else
      flash.now[:danger] = 'コメントの投稿に失敗しました'
      redirect_to request.referer
    end
  end

  def destroy
    @event = Event.find(params[:event_id])

    if @comment.student == current_student
      @comment.destroy
      flash.now[:danger] = 'コメントを削除しました'
      @comments = @event.comments.includes(:student)
      event_count(@event)
      respond_to do |format|
        format.html
        format.js 
      end
    else
      flash.now[:danger] = '他人のコメントは削除できません'
      redirect_to request.referer
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def correct_user
    @comment = Comment.find(params[:id])
    redirect_to root_path unless @comment.student==current_student
  end
end
