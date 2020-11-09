class EventsController < ApplicationController
  before_action :correct_user, only: [:destroy]

  def index
    @events = Event.search(params[:search])
  end

  def show
    @event=Event.find(params[:id])
    @comment = Comment.new
    @comments = @event.comments
    event_count(@event)
  end

  def new
    @event=Event.new
  end

  def create 
    @event=current_club.events.build(event_params)

    if @event.save 
      flash[:success]='イベントが投稿されました'
      redirect_to @event
    else  
      flash.now[:danger]='イベントが投稿されませんでした'
      render :new
    end

  end

  def edit
    @event=Event.find(params[:id])
  end

  def update 
    @event=Event.find(params[:id])
    if @event.update(event_params)
      flash[:success]='イベントが投稿されました'
      redirect_to @event
    else  
      flash.now[:danger]='イベントが投稿されませんでした'
      render :new
    end
  end

  def destroy 
    @event.destroy 
    flash[:success]="イベントを削除しました"
    redirect_to root_path

  end
  private

    def event_params
      params.require(:event).permit(:content, :title)
    end
    def correct_user
      @event = current_club.events.find_by(id: params[:id])
      unless @event
        redirect_to root_url
      end
    end
end
