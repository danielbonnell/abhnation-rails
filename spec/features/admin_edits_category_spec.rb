require 'rails_helper'

feature 'admin edits category', %Q{
  As an admin, I want to edit a category or subcategory, so that it better
  represents the content under it.
  Acceptance Criteria:
  * [X] - I can edit the name of a category inline.
  * [X] - I can edit the name of a subcategory inline.
  } do

  let(:admin) do
    FactoryGirl.create(:user, admin: true)
  end

  before(:each) do
    @category = FactoryGirl.create(:category)
  end

  scenario 'admin edits category title', focus: true do
    log_in_as(admin)
    visit admin_categories_path

    bip_area @category, :name, 'Test Category'
    expect(page).to have_content @category.name
  end
end
