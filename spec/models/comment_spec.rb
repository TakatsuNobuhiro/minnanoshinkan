require 'rails_helper'

RSpec.describe Comment, :type => :model do
  before { @comment = build(:comment) }

  describe 'validation' do
    it 'そのままならOK' do
      expect(@comment.valid?).to eq(true)
    end
    it 'commentが141文字ならアウト' do
      @comment.content = 'a' * 141
      expect(@comment.valid?).to eq(false)
    end
    it 'commentが140文字ならOK' do
      @comment.content = 'a' * 140
      expect(@comment.valid?).to eq(true)
    end
  end
end
