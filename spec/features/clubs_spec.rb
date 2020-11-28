require 'rails_helper'

RSpec.feature 'Clubs', type: :feature do
  scenario 'ログインする' do
    club = create(:club)
    visit root_path
    click_link 'サークルログイン'
    fill_in 'Email', with: club.email
    fill_in 'Password', with: club.password
    click_button 'ログイン'
    expect(page).to have_content 'ログインしました'
    expect(page).to have_content '大学'
    click_link 'ログアウト'
    expect(page).to have_content 'ログアウトしました。'
  end
end
