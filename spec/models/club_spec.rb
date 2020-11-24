require 'rails_helper'

RSpec.describe Club, :type => :model do
  before { @club = create(:club) }
  describe 'バリデーション' do
    it '全て正常に記入されていればOK' do
      expect(@club.valid?).to eq(true)
    end
    it 'nameが空だとNG' do
      @club.name = ''
      expect(@club.valid?).to eq(false)
    end
    it 'emailが空だとNG' do
      @club.email = ''
      expect(@club.valid?).to eq(false)
    end
    it 'universityが空だとNG' do
      @club.university = ''
      expect(@club.valid?).to eq(false)
    end
    it 'intercollegeがnillだとNG' do
      @club.intercollege = nil
      expect(@club.valid?).to eq(false)
    end
    it 'activeがnillだとNG' do
      @club.active = nil
      expect(@club.valid?).to eq(false)
    end
    it 'nameの長さが75文字ならOK' do
      @club.name = 'a' * 75
      expect(@club.valid?).to eq(true)
    end
    it 'nameの長さが76文字ならNG' do
      @club.name = 'a' * 76
      expect(@club.valid?).to eq(false)
    end

    # enumのテスト
  end
end
