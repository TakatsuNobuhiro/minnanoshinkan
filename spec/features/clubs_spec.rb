require 'rails_helper'

RSpec.feature 'Clubs', type: :feature do
  include_context "login setup"
  scenario 'ログインしてからログアウト' do
    login(:club,'サークル')
    click_link 'ログアウト'
    expect(page).to have_content 'ログアウトしました。'
  end
end
