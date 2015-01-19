require 'rails_helper'

feature 'user views article', %{
  As a user, I want to view a list of everything within a category, so that I can
  have an overview of the content of that category.
  Acceptance Criteria:
  * [X] - I can see a list of all articles within a category.
  * [ ] - I can see a list of all galleries within a category.
  * [X] - I can see a list of all subcategories within a category.
  * [X] - I can see a list of all articles within each subcategory listed.
  * [ ] - I can see a list of all galleries within each subcategory listed.
  } do

  let(:category) do
    FactoryGirl.create(:category)
  end

  let(:subcategory) do
    FactoryGirl.create(:category, name: "Subcat", parent: category)
  end

  let(:article) do
    FactoryGirl.create(:article, category: subcategory)
  end

  scenario 'user views category' do
    visit category_path(category)

    within(:css, "body > div:nth-child(2) > ul") do
      expect(page).to have_content(category.name)
    end

    first(:css, "body > div:nth-child(3) > div *") do
      expect(page).to have_content(category.name)
      expect(page).to have_content(subcategory.name)
      expect(page).to have_content(article.slug)
    end

    # within(:css, "body > div:nth-child(1) > nav > section > ul") do
    #   expect(page).to have_content(category.name)
    #   expect(page).to have_content(subcategory.name)
    #   expect(page).to have_content(article.slug)
    # end
  end
end
