class PremiumMailer < ApplicationMailer
  def send_mail(club)
    @club = club
    mail(
      from: 'minnanoshinkan.com',
      to:   club.student_likes.email,
      subject: 'お問い合わせ通知'
    )
  end
end
