require "rails_helper"

feature "user sees gravatar", %{
  As an authenticated user, I want to use my Gravatar for my avatar, so that I
  can distinguish myself from other users.
  Acceptance Criteria:
  * [X] - I see my Gravatar if the email address I used to register has a
          Gravatar associated with it.
  * [X] - I see the default Gravatar if I don't have one associated with my
          email address.
  } do

  scenario "user sees their gravatar" do
    user = FactoryGirl.create(:user, email: "acidstealth@gmail.com")
    log_in_as(user)
    expect(page).to have_selector("img[alt=\"#{user.username}'s Gravatar\"]")
  end

  scenario "user sees the default gravatar" do
    user = FactoryGirl.create(:user)
    log_in_as(user)
    expect(page).to have_selector("img[alt=\"#{user.username}'s Gravatar\"]")
  end
end
