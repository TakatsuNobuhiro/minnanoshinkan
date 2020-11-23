require 'rails_helper'

RSpec.describe Comment, type: :model do
  before { @comment = build(:comment) }

  describe 'validation' do
    it 'そのままならOK' do
      # expect(@comment.valid?).to eq(true)
    end
  end
end
