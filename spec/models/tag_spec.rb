require 'rails_helper'

RSpec.describe Tag, type: :model do
  before { @tag = build(:tag) }
  it 'nameの長さが30文字ならOK' do
    @tag.name = 'a' * 30
    expect(@tag.valid?).to eq(true)
  end
  it 'nameの長さが31文字ならNG' do
    @tag.name = 'b' * 31
    expect(@tag.valid?).to eq(false)
  end
end
