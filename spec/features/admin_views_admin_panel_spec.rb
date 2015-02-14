require 'rails_helper'

feature 'admin views admin panel', %Q{
  As an admin, I want to view the admin panel, so that I can see what tools are available to me.
  Acceptance Criteria:
  * [X] - I can view the main page of the admin panel only if I am logged in
          and have admin access.
  * [X] - If I am not logged in or don’t have admin access, I can’t see a link
          to the admin panel in the side bar.
  * [X] - If I am not logged in or don’t have admin access, I get a 404 error
          when visiting the admin namespace.
  } do

  let(:user1) do
    FactoryGirl.create(:user)
  end

  let(:admin) do
    FactoryGirl.create(:user, admin: true)
  end

  before { Capybara.reset_session! }

  scenario 'unauthenticated user' do
    visit admin_root_path
    expect(page).to_not have_content('Command Information Center')
  end

  scenario 'authenticated user who is not an admin' do
    log_in_as(user1)
    visit admin_root_path

    expect(page).to_not have_content('Command Information Center')
  end

  scenario 'authenticated user who is an admin' do
    log_in_as(admin)
    visit admin_root_path

    expect(page).to have_content('Command Information Center')
  end
end
