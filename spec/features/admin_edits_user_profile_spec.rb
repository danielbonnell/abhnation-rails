require 'rails_helper'

feature 'admin edits user profile', %Q{
  As an admin, I want to view a list of all users, so that I can edit their
  profiles.
  Acceptance Criteria:
  * [X] - I can edit the profile information of any user, including their
          username and rank.
  } do

  let(:admin) do
    FactoryGirl.create(:user, admin: true)
  end

  let(:user) do
    FactoryGirl.create(:user)
  end

  scenario 'admin edits user profile' do
    log_in_as(admin)
    visit edit_admin_user_path(user)

    fill_in('user[username]', with: "Foo_Bar")

    click_button('Update')

    expect(page).to have_content('Foo_Bar')
  end
end
