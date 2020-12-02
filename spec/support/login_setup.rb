RSpec.shared_context "login setup" do
  def login(subject,name)
    user = create(subject)
    visit root_path
    click_link "#{name}ログイン"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'ログイン'
    expect(page).to have_content 'ログインしました'
  end
end