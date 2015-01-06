require 'rails_helper'

feature 'user views homepage', %Q{
  As a user, I want to see the main page, so that I can navigate through the site.
  Acceptance Criteria:
  * [ ] - I see the title of the website.
  * [ ] - I see the top bar nav menu.
  } do

  let(:user) do
    FactoryGirl.create(:user)
  end

  scenario 'without authenticating' do
    visit '/'
    expect(page).to have_content('The Abh Nation')
  end

  scenario 'with authenticating' do
    log_in_as(user)
    visit '/'
    expect(page).to have_content('The Abh Nation')
  end
end
