require 'rails_helper'

feature 'user views article', %{
  As a user, I want to view a list of everything within a subcategory, so that
  I can have an overview of the content of that subcategory.
  Acceptance Criteria:
  * [X] - I can see a list of all articles within a subcategory.
  * [ ] - I can see a list of all galleries within a subcategory.
  } do

  let(:category) do
    FactoryGirl.create(:category)
  end

  let(:subcategory) do
    FactoryGirl.create(:category, name: "Subcat", parent: category)
  end

  let(:subcat_article) do
    FactoryGirl.create(:article, category: subcategory)
  end

  scenario 'user views subcategory' do
    visit category_path(subcategory)

    within(:css, "body > div:nth-child(2) > ul") do
      expect(page).to have_content(category.name)
    end

    first(:css, "body > div:nth-child(3) > div *") do
      expect(page).to have_content(subcat_article.slug)
      expect(page).to have_content(subcategory.name)
    end

    # within(:css, "body > div.row.collapse > nav > section > ul") do
    #   expect(page).to have_content(category.name)
    #   expect(page).to have_content(subcat_article.slug)
    #   expect(page).to have_content(subcategory.name)
    #   expect(page).to have_content(article.slug)
    # end
  end
end
