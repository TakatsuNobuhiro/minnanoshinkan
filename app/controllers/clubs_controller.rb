class ClubsController < ApplicationController
  def index
    set_category
    clubs = Club
    if student_signed_in? && params[:category_id].blank?
      params[:category_id] = current_student.category.parent_id
    elsif club_signed_in? && params[:category_id].blank?
      params[:category_id] = current_club.category.id
    end
    if params[:name].present?
      clubs = clubs.search(params[:name])
    elsif params[:active].present?
      clubs = clubs.where(active: params[:active])
    elsif params[:intercollege].present?
      clubs = clubs.where(intercollege: params[:intercollege])
    elsif params[:category_id].present?
      clubs = clubs.where(category_id: params[:category_id])
    end
    @clubs = clubs.with_attached_avatar.page(params[:page]).per(25)
    respond_to do |format|
      format.html
      format.js { render template: 'clubs/clubs.js.erb' }
    end
  end

  def show
    @club = Club.find(params[:id])
    @events = @club.events
    club_count(@club)
    respond_to do |format|
      format.html
      format.js { render template: './layouts/calendar.js.erb' }
    end
  end

  def student_likes
    @club = Club.find(params[:id])
    @students = @club.student_likes.page(params[:page]).per(25)
    respond_to do |format|
      format.html
      format.js { render template: 'students/students.js.erb' }
    end
  end
end
