require 'rails_helper'

RSpec.describe Student, type: :model do
  before { @student = create(:student) }
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
end
