require 'rails_helper'

feature 'admin deletes user profile', %Q{
  As an admin, I want to view a list of all users, so that I can delete their
  accounts
  Acceptance Criteria:
  * [X] - I can delete a user’s account.
  } do

  let(:admin) do
    FactoryGirl.create(:user, admin: true)
  end

  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  scenario 'admin deletes user profile' do
    log_in_as(admin)
    visit admin_users_path
    # binding.pry
    within(:css, "li##{@user.username}") do
      find_by_id("#{@user.username}").click
    end

    expect(page).to_not have_content(@user.username)
  end
end
