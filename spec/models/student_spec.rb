require 'rails_helper'

RSpec.describe Student, type: :model do
  before { @student = create(:student) }
  let(:other_student) { create(:student) }
  let(:club) { create(:club) }
  let(:event) { create(:event) }

  let(:other_student) { create(:student) }
  describe 'バリデーション' do
    it '全て正常に記入されていればOK' do
      expect(@student.valid?).to eq(true)
    end
    it 'nameが空だとNG' do
      @student.name = ''
      expect(@student.valid?).to eq(false)
    end
    it 'emailが空だとNG' do
      @student.email = ''
      expect(@student.valid?).to eq(false)
    end
    it 'universityが空だとNG' do
      @student.university = ''
      expect(@student.valid?).to eq(false)
    end

    it 'nameの長さが30文字ならOK' do
      @student.name = 'a' * 30
      expect(@student.valid?).to eq(true)
    end
    it 'nameの長さが31文字ならNG' do
      @student.name = 'a' * 31
      expect(@student.valid?).to eq(false)
    end

    # enumのテスト
  end
  describe 'メソッド' do
    it 'follow確認' do
      @student.follow(other_student)
      expect(@student.following?(other_student)).to eq(true)
    end

    it 'followしてからunfolowして確認' do
      @student.follow(other_student)
      @student.unfollow(other_student)
      expect(@student.following?(other_student)).to eq(false)
    end

    it 'club_favoriteしてから確認' do
      @student.club_favorite(club)
      expect(@student.club_favorite?(club)).to eq(true)
    end
    it 'club_favoriteしてunfavoriteしてから確認' do
      @student.club_favorite(club)
      @student.club_unfavorite(club)
      expect(@student.club_favorite?(club)).to eq(false)
    end
    it 'event_favoriteしてから確認' do
      @student.event_favorite(event)
      expect(@student.event_favorite?(event)).to eq(true)
    end
    it 'event_favoriteしてunfavoriteしてから確認' do
      @student.event_favorite(event)
      @student.event_unfavorite(event)
      expect(@student.event_favorite?(event)).to eq(false)
    end
  end
end
