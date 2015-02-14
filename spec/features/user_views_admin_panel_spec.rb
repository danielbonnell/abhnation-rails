require 'rails_helper'

feature 'user views homepage', %Q{
  As an admin, I want to view the admin panel, so that I can see what tools are available to me.
  Acceptance Criteria:
  * [ ] - I can view the main page of the admin panel only if I am logged in
          and have admin access.
  * [ ] - If I am not logged in or don’t have admin access, I can’t see a link
          to the admin panel in the side bar.
  * [ ] - If I am not logged in or don’t have admin access, I get a 404 error
          when visiting the admin namespace.
  } do

  let(:user) do
    FactoryGirl.create(:user)
  end

  scenario 'unauthenticated user', focus: true do
    visit '/admin'

    expect(page).to_not have_content('Command Information Center')
  end

  scenario 'authenticated user who is not an admin', focus: true do
    log_in_as(user)
    visit '/admin'

    expect(page).to_not have_content('Command Information Center')
  end

  scenario 'authenticated user who is an admin', focus: true do
    admin = FactoryGirl.create(:user, admin: true)
    log_in_as(admin)
    visit '/admin'

    expect(page).to have_content('Command Information Center')
  end
end
