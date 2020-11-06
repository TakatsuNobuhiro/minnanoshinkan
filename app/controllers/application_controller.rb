class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception



  def counts(student)

    @count_followings = student.followings.count
    @count_followers = student.followers.count
  end


end
