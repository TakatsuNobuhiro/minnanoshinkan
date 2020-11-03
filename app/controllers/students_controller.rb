class StudentsController < ApplicationController
  before_action :set_student ,only: [:show, :edit, :update]
  def index
    @stundents = Student.all
  end

  def show
  end

  def edit
  end

  def update
    if @studnet.update(student_params)
      flash[:success]= 'プロフィールを編集しました'
      redirect_to @student

    else 
      flash.now[:danger] = 'プロフィールの編集に失敗しました'
      render :edit 
    end
  end

  private
  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name,:detail,:age,:universituy,:department,:hobby)
  end
end
