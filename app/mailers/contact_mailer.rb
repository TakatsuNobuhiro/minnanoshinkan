class ContactMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_mail.subject
  #

  def contact_mail(contact)
    @contact = contact
    mail(
      :from => 'minnanoshinkan@gmail.com',
      :to => 'nobuhiro19980622@gmail.com',
      :subject => @contact[:title]
    )
  end
end
