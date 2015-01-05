require 'rails_helper'

feature 'user registers', %Q{
  As a user, I want to register an account, so that I can view restricted content.
  Acceptance Criteria:
  * [X] - I have an option to register an account
  * [X] - I must supply a username, email, and password.
  * [X] - I am redirected to my account overview upon successful registration.
  * [ ] - I must confirm my email address.
  * [ ] - If I don’t confirm my email address within 24 hours, my account will be deleted.
  * [X] - I see an error message if my registration credentials are invalid.
  } do


  username = "Lafiel_Abriel"
  email = "lafiel.abriel@abhnation.com"

  scenario 'provide valid registration information' do
    visit new_user_registration_path

    register_user(username, email)

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content(username)
    expect(page).to have_content(email)
    expect(page).to have_content('Log Out')
  end

  scenario 'provide invalid registration information' do
    visit new_user_registration_path

    click_button 'Log in'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Log Out')
  end
end
