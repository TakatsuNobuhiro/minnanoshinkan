class PremiumMailsController < ApplicationController
  def new
    @premium_mail=PremiumMail.new
  end

  def create
    @premium_mail=current_club.premium_mails.build(mail_params)
    if @premium_mail.save 
      PremiumMailer.send_mail(@premium_mail).deliver_now
      flash[:success] = 'メールを送信しました'
      redirect_to club_path(current_club.id)

    else 
      flash.now[:danger] = 'メールの送信に失敗しました'
      render :new
    end
  end

  def mail_params
    params.require(:premium_mail).permit(:title,:message,:content)
  end
end
