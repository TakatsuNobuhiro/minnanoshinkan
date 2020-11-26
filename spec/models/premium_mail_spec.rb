require 'rails_helper'

RSpec.describe PremiumMail, type: :model do
  describe 'バリデーション' do
    before { @mail = create(:premium_mail) }
    it 'titleの長さが100文字ならOK' do
      @mail.title = 'a' * 100
      expect(@mail.valid?).to eq(true)
    end
    it 'titleの長さが101文字ならNG' do
      @mail.title = 'a' * 101
      expect(@mail.valid?).to eq(false)
    end
  end
end
