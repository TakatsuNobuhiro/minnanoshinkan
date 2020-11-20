class PremiumMailer < ApplicationMailer
  def send_mail(mail)
    @mail = mail
    email_list = []
    mail.club.student_likes.each { |student| email_list.push(student.email) }

    mail(from: 'minnanoshinkan@gmail.com', to: email_list, subject: mail.title)
  end
end
