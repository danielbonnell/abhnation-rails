require "rails_helper"

feature "user edits avatar", %{
  As an authenticated user, I want to upload an image for my avatar, so that I can distinguish myself from other users.
  Acceptance Criteria:
  * [X] - I have an option to upload an image from my computer as my avatar.
  * [X] - I see an error if the file I supplied is not a valid image format (jpg, gif, png).
  * [X] - I see an error if the file size of the image I supplied is too large.
  * [X] - I see the image I supplied as my new avatar.
  } do

  scenario "user uploads a valid image file within the size limit" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"

    visit edit_user_registration_path(user)

    attach_file('user[avatar]', File.join(Rails.root, 'spec/data/Lafiel_summer_avatar.jpg'))
    fill_in "user[current_password]", with: user.password
    click_button "Update"

    visit user_path(user)

    expect(page).to have_selector("img[alt=\"#{user.username}'s Avatar\"]")
  end

  scenario "user uploads an invalid file type" do

  end

  scenario "user uploads a file that is too large" do

  end
end
