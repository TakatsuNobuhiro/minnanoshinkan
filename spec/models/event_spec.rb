require 'rails_helper'

RSpec.describe Event, :type => :model do
  before { @event = create(:event) }
  describe 'バリデーション' do
    it '全て正常に記入されていればOK' do
      expect(@event.valid?).to eq(true)
    end
    it 'titleが空だとNG' do
      @event.title = ''
      expect(@event.valid?).to eq(false)
    end

    it 'start>endだとNG' do
      @event.start = '2020-11-24 07:18:00'
      expect(@event.valid?).to eq(false)
    end

    it 'titleの長さが100文字ならOK' do
      @event.title = 'a' * 100
      expect(@event.valid?).to eq(true)
    end
    it 'titleの長さが101文字ならNG' do
      @event.title = 'a' * 101
      expect(@event.valid?).to eq(false)
    end

    # enumのテスト
  end
end
