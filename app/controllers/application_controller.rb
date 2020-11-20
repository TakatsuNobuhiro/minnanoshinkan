class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def counts(student)
    @count_followings = student.followings.count
    @count_followers = student.followers.count
    @count_club_likes = student.club_likes.count
  end

  def club_count(club)
    @count_clubs = club.student_likes.count
    @count_events = club.events.count
  end

  def event_count(event)
    @count_like_events = event.student_event_likes.count
  end

  #guset_login
  def check_guest
    email = resource&.email || params[:user][:email].downcase
    if email == 'test@example.com'
      flash[:danger] = 'ゲストユーザーの変更・削除はできません。'
      redirect_to root_path
    end
  end
end
