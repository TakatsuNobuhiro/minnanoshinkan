class CommentsController < ApplicationController
  before_action :authenticate_student!
  def create
      @event=Event.find(params[:event_id])
      @comment = @event.comments.new(comment_params)
      @comment.student_id = current_student.id
      if @comment.save
          flash[:success]='コメントの投稿に成功しました'
          @comment.event.create_notification_comment!(current_student, @comment.id)
          redirect_to request.referer
      else
          flash[:danger]='コメントの投稿に失敗しました'
          redirect_to request.referer
      end
  end
  
  def destroy
      @comment = Comment.find(params[:id])
      if @comment.student==current_student
          
          @comment.destroy
          flash[:danger]='コメントを削除しました'
          redirect_to request.referer
      else
          flash[:danger]='他人のコメントは削除できません'
          redirect_to request.referer
      end
  end

      
  
  private
  def comment_params
      params.require(:comment).permit(:content)
  end
end
