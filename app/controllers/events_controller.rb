class EventsController < ApplicationController
  def index
    @events=Event.all
  end

  def show
    @event=Event.find(params[:id])
  end

  def new
    @event=Event.new
  end

  def create 
    @event = Event.new(event_params)
    if @event.save 
      flash[:success]='イベントが投稿されました'
      redirect_to event_path(@event.id)
    else  
      flash.now[:danger]='イベントが投稿されませんでした'
      render :new
    end

  end

  def edit
    @event=Event.find(params[:id])
  end

  def update 
    @event = Event.new(event_params)
    if @event.save 
      flash[:success]='イベントが投稿されました'
      redirect_to @event
    else  
      flash.now[:danger]='イベントが投稿されませんでした'
      render :new
    end
  end

  def destroy 

  end
  private

  def event_params
    params.require(:event).permit(:content,:name)
  end
end
