class PremiumMailer < ApplicationMailer
  def send_mail(mail)
    @mail = mail
    email_list=[]
    mail.club.student_likes.each do |student|
      email_list.push(student.email)
    end

    mail(
      from: 'minnanoshinkan.com',
      to:   email_list,
      subject: mail.title
    )
  end
end
