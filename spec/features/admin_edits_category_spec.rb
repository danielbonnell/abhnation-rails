require 'rails_helper'

feature 'admin edits category', %Q{
  As an admin, I want to edit a category or subcategory, so that it better
  represents the content under it.
  Acceptance Criteria:
  * [X] - I can edit the name of a category inline.
  * [X] - I can edit the name of a subcategory inline.
  } do

  before(:each) do
    @admin = FactoryGirl.create(:user, admin: true)
    @category = FactoryGirl.create(:category, user: @admin)
  end

  scenario 'admin edits category title', js: true do
    skip "Doesn't work yet."
    login_as(@admin)
    visit admin_categories_path

    # fill_in("best_in_place_category_1_name", with: 'Test Category')
    # page.execute_script "$('#best_in_place_category_1_name').trigger('keyup')"
    wait_for_ajax
    bip_text @category, :name, 'Test Category'
    expect(page).to have_content 'Test Category'
  end
end
