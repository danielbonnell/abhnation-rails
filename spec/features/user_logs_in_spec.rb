require 'rails_helper'

feature 'user signs in', %Q{
  As a user, I want to log in, so that I can view restricted content.
  Acceptance Criteria:
  * [X] - I have an option to log in.
  * [X] - I see an error message if my log in credentials are invalid.
  * [X] - I see my avatar if I am logged in.
  * [X] - I have an option to edit my profile if I am logged in.
  } do

  let(:user) do
    FactoryGirl.create(:user)
  end

  scenario 'specify valid credentials' do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Logged in successfully')
    expect(page).to have_content(user.username)
    expect(page).to have_content('My Account')
    expect(page).to have_selector('li.avatar')
    expect(page).to have_content('Log Out')
  end

  scenario 'specify invalid credentials' do
    visit new_user_session_path

    click_button 'Log in'
    expect(page).to have_content('Invalid email or password')
    expect(page).to_not have_content('Log Out')
  end
end
