require 'rails_helper'

RSpec.feature 'Students', type: :feature do
  scenario 'ログインする' do
    student = create(:student)
    visit root_path
    click_link '学生ログイン'
    fill_in 'Email', with: student.email
    fill_in 'Password', with: student.password
    click_button 'ログイン'
    expect(page).to have_content 'ログインしました'
    click_link 'ログアウト'
    expect(page).to have_content 'ログアウトしました。'
  end
end
