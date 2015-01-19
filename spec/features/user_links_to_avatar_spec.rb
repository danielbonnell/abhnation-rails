require "rails_helper"

feature "user edits avatar", %{
  As an authenticated user, I want to use an image from another site for my
  avatar, so that I can distinguish myself from other users.
  Acceptance Criteria:
  * [X] - I have an option to use an image from another site as my avatar.
  * [X] - I see an error if the link I supplied is not a valid image format
          (jpg, gif, png).
  * [X] - I see an error if the file size of the link I supplied is too large.
  * [X] - I see the linked image I supplied as my new avatar.
  } do

    let(:user) do
      FactoryGirl.create(:user)
    end

    base = "http://www.abhnation.com/ACIDSTEALTH/"

    scenario "user links to a valid image file within the size limit" do
      log_in_as(user)

      visit edit_user_registration_path(user)
      fill_in "user[remote_avatar_url]", with: "#{base}RAFIRU-2.jpg"
      first('#account > div:nth-child(4) > div').click_button "Update"

      visit user_path(user)
      
      expect(page).to have_selector(
        "img[alt=\"#{user.username}'s Avatar\"]"
      )
    end

    # scenario "user links to an invalid file type" do
    #   log_in_as(user)
    #
    #   visit edit_user_registration_path(user)
    #   fill_in "user[avatar_link]", with: "#{base}UED-Avatar_remodeled.bmp"
    #   fill_in "user[current_password]", with: user.password
    #   click_button "Update"
    #
    #   expect(page).to have_content "is not a valid image format (jpg, gif, png)"
    # end

    # scenario "user links to a file that is too large" do
    #   log_in_as(user)
    #
    #   visit edit_user_registration_path(user)
    #   fill_in "user[avatar_link]",
    #           with: "#{base}Banners_and_Vectors_by_LegaC.png"
    #   fill_in "user[current_password]", with: user.password
    #   click_button "Update"
    #
    #   expect(page).to have_content "should be less than 1 MB"
    # end

    scenario "user deletes uploaded avatar" do
      log_in_as(user)

      visit edit_user_registration_path(user)
      check "user[remove_avatar]"
      first('#account > div:nth-child(4) > div').click_button "Update"


      expect(page).to_not have_selector(
        "img[alt=\"#{user.username}'s Avatar\"]"
      )
    end
  end
