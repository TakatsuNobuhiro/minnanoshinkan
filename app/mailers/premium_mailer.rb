class PremiumMailer < ApplicationMailer
  def send_mail(mail, club)
    @mail = mail
    email_list = []
    club.student_likes.each { |student| email_list.push(student.email) }

    mail(:from => 'minnanoshinkan@gmail.com', :to => email_list, :subject => mail.title)
  end
end
