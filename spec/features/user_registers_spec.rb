require "rails_helper"

feature "user registers", %Q{
  As a user, I want to register an account, so that I can view restricted content.
  Acceptance Criteria:
  * [X] - I have an option to register an account
  * [X] - I must supply a username, email, and password.
  * [X] - I am redirected to my account overview upon successful registration.
  * [ ] - I must confirm my email address.
  * [ ] - If I don’t confirm my email address within 24 hours, my account will be deleted.
  * [X] - I see an error message if my registration credentials are invalid.
  } do



  scenario "provide valid registration information" do
    visit new_user_registration_path

    username = "Lafiel_Abriel"
    email = "lafiel.abriel@abhnation.com"

    register_user(username, email)

    expect(page).to have_content("You have registered successfully.")
    expect(page).to have_content(username)
    expect(page).to have_content("Log Out")
  end

  scenario "provide invalid registration information" do
    visit new_user_registration_path

    click_button "Register"

    expect(page).to have_content("Username can't be blank")
    expect(page).to_not have_content("Log Out")
  end
end
