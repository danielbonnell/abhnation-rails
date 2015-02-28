require 'rails_helper'

feature 'admin views list of categories', %Q{
  As an admin, I want to view a list of all categories and subcategories, so
  that I can see what type of content the site has.
  Acceptance Criteria:
  * [X] - I see a paginated list of categories ordered by name.
  * [X] - I can see a list of subcategories belonging to a category.
  } do

  let(:admin) do
    FactoryGirl.create(:user, admin: true)
  end

  before(:each) do
    3.times do
      FactoryGirl.create(:category)
      3.times do
        FactoryGirl.create(:category, parent: Category.cat_parents.last)
      end
    end
  end

  scenario 'admin views list of categories' do
    log_in_as(admin)
    visit admin_categories_path

    Category.cat_parents.each_with_index do |category, index|
      expect(page).to have_selector(
        "#admin > div > ul > li:nth-child(#{index + 1})",
        text: category.name
      )
      category.subcategories.each_with_index do |subcategory, subindex|
        expect(page).to have_selector(
          "#admin > div > ul > li:nth-child(#{index + 1}) > ul > li:nth-child(#{subindex + 1})",
          text: subcategory.name
        )
      end
    end
  end
end
