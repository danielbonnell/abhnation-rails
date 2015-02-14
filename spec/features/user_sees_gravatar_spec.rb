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

  let(:user1) do
    FactoryGirl.create(:user, email: "acidstealth@gmail.com")
  end

  let(:user2) do
    FactoryGirl.create(:user)
  end

  scenario "user sees their gravatar" do
    log_in_as(user1)
    expect(page).to have_selector("img[alt=\"#{user1.username}'s Gravatar\"]")
  end

  scenario "user sees the default gravatar" do
    log_in_as(user2)
    expect(page).to have_selector("img[alt=\"#{user2.username}'s Gravatar\"]")
  end
end
