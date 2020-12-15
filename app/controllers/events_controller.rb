class EventsController < ApplicationController
  before_action :authenticate_club!, only: %i[new create destroy update edit]
  before_action :set_event, only: %i[show update edit destroy]
  def index
    if params[:title].present?
      events = Event.events_title_search(params[:title])
    elsif params[:start].present?
      events = events.where('start > ?', params[:start]) 
    elsif params[:end].present?
      events = events.where('end < ?', params[:end]) 
    elsif params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      events = @tag.events
    else
      events = Event
    end
    @tag_lists = Tag.all
    @events =
      Kaminari.paginate_array(
        events.includes(:tags).includes([:club]).where('start > ?', Date.today).order(start: :asc)
      ).page(params[:page]).per(100)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @comment = Comment.new
    @comments = @event.comments.includes(:student)
    event_count(@event)
    gon.lat = @event.latitude
    gon.lng = @event.longitude
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_club.events.build(event_params)
    tag_list = params[:event][:tag_ids].split(',')
    if @event.save
      @event.save_tags(tag_list)

      flash[:success] = 'イベントが投稿されました'
      @event.create_notification_event!(current_club)
      redirect_to @event
    else
      flash.now[:danger] = 'イベントが投稿されませんでした'
      render :new
    end
  end

  def edit
    @tag_list = @event.tags.pluck(:name).join(',')
  end

  def update
    tag_list = params[:event][:tag_ids].split(',')
    if @event.update(event_params)
      @event.save_tags(tag_list)
      tag_delete
      flash[:success] = 'イベントが投稿されました'
      redirect_to @event
    else
      flash.now[:danger] = 'イベントが投稿されませんでした'
      render :new
    end
  end

  def destroy
    @event.destroy
    tag_delete
    flash[:success] = 'イベントを削除しました'
    redirect_to club_path(current_club.id)
  end

  private

  def event_params
    params.require(:event).permit(
      :content,
      :title,
      :start,
      :end,
      :address,
      :latitude,
      :longitude
    )
  end

  def tag_delete
    Tag.all.each { |tag| tag.delete if tag.tag_relationships.length == 0 }
  end
  def set_event
    @event = Event.find(params[:id])
  end
end
