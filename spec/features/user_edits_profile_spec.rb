require 'rails_helper'

feature 'user edits profile', %Q{
  As an authenticated user, I want to edit my profile, so that I can distinguish myself from other users.
  Acceptance Criteria:
  * [X] - I can update my name.
  * [X] - I can update my location.
  * [X] - I can update my age.
  * [X] - I can update my website.
  } do

  let(:user) do
    FactoryGirl.create(:user)
  end

  scenario 'user edits optional information' do
    log_in_as(user)
    visit edit_user_registration_path(user)

    within(:css, "body > div:nth-child(2) > ul") do
      expect(page).to have_content("Edit Profile")
    end

    fill_in "user[first_name]", with: "Lafiel"
    fill_in "user[last_name]", with: "Abriel"
    fill_in "user[age]", with: "23"
    fill_in "user[website]", with: "http://www.abhnation.com/"
    fill_in "user[current_password]", with: user.password
    click_button "Update"

    expect(page).to have_content("Your account has been updated successfully.")
  end

  scenario 'user views edits they just created' do
    log_in_as(user)
    visit edit_user_registration_path(user)

    within(:css, "body > div:nth-child(2) > ul") do
      expect(page).to have_content(user.username)
    end

    within(:css, "form#edit_user") do
      expect(find_field("user[first_name]")).to have_content user.first_name
      expect(find_field("user[last_name]")).to have_content user.last_name
      expect(find_field("user[age]")).to have_content user.age
      expect(find_field("user[website]")).to have_content user.website
    end
  end

  scenario 'user enters invalid age' do
    log_in_as(user)
    visit edit_user_registration_path(user)

    fill_in "user[age]", with: "301"
    click_button "Update"

    expect(page).to_not have_content("Your account has been updated successfully.")
  end

  scenario 'user enters invalid website url' do
    log_in_as(user)
    visit edit_user_registration_path(user)

    fill_in "user[website]", with: "233://blah-com"
    click_button "Update"

    expect(page).to_not have_content("Your account has been updated successfully.")
  end
end
