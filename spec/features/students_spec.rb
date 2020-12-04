require 'rails_helper'

RSpec.feature 'Students', type: :feature do
  include_context "login setup"
  scenario 'ログインしてからログアウト' do
    login(:student, '学生')
    click_link 'ログアウト'
    expect(page).to have_content 'ログアウトしました。'
  end
end
