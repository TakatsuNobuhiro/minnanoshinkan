class EventsController < ApplicationController
  before_action :correct_user, only: %i[destroy]

  def index
    if params[:search].present?
      events =
        Event.events_search(params[:search]).where('start > ?', Date.today)
          .order(start: :asc)
    elsif params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      events = @tag.events.where('start > ?', Date.today).order(start: :asc)
    else
      events = Event.where('start > ?', Date.today).order(start: :asc)
    end
    @tag_lists = Tag.all
    @events = Kaminari.paginate_array(events).page(params[:page]).per(10)
  end

  def show
    @event = Event.find(params[:id])
    @comment = Comment.new
    @comments = @event.comments
    event_count(@event)
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
    @event = Event.find(params[:id])
    @tag_list = @event.tags.pluck(:name).join(',')
  end

  def update
    @event = Event.find(params[:id])
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
    redirect_to root_path
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
  def correct_user
    @event = current_club.events.find_by(id: params[:id])
    redirect_to root_url unless @event
  end

  def tag_delete
    Tag.all.each { |tag| tag.delete if tag.tag_relationships.length == 0 }
  end
end
