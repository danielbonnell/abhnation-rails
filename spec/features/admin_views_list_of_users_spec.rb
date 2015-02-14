require 'rails_helper'

feature 'admin views admin panel', %Q{
  As an admin, I want to view a list of all users, so that I can see who is
  using the site.
  Acceptance Criteria:
  * [X] - I can see a paginated list of users.
  * [ ] - I can order the list by name, date joined, rank (admin, moderator,
          user, restricted, banned), or email address.
  } do

  let(:admin) do
    FactoryGirl.create(:user, admin: true)
  end

  before(:each) do
    11.times do
      FactoryGirl.create(:user)
    end
  end

  scenario 'admin views list of users' do
    log_in_as(admin)
    visit admin_users_path

    click_link('2')

    expect(page).to have_content(User.last.username)
  end
end
