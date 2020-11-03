class StudentsController < ApplicationController
  def index
    @stundet=Stundet.all
  end

  def show
    @student = Stundent.find(params[:id])
  end

  def edit
    @student = Stundent.find(params[:id])
  end
end
