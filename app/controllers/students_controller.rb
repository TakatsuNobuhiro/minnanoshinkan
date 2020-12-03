class StudentsController < ApplicationController
  def index
    @students = Student.with_attached_avatar.search(params[:search])
  end

  def show
    @student = Student.find(params[:id])
    club_like_events=[]
    @student.club_likes.includes(:events).each do |club|
      club_like_events|=club.events
    end
    @event_likes=@student.event_likes
    @events = club_like_events|@event_likes
    counts(@student)
  end
  def followings
    @student = Student.find(params[:id])
    @followings = @student.followings.page(params[:id])
    counts(@student)
  end

  def followers
    @student = Student.find(params[:id])
    @followers = @student.followers.page(params[:id])
    counts(@student)
  end
end
