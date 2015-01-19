require 'rails_helper'

feature 'user views article', %{
  As a user, I want to view articles, so that I can learn more.
  Acceptance Criteria:
  * [X] - I can see the title, category or subcategory, text, and author
          (if included) of an article.
  * [X] - I can see the title, category, and subcategory of an article in the
          nav bar.
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

  scenario 'user views article' do
    visit category_article_path(subcategory,article)

    within(:css, "body > div:nth-child(2) > ul") do
      expect(page).to have_content(subcategory.name)
      expect(page).to have_content(category.name)
    end

    first(:css, "body > div:nth-child(3) > div *") do
      expect(page).to have_content(article.title)
      expect(page).to have_content(article.text)
      expect(page).to have_content(article.user.username)
    end

    within(:css, "body > div:nth-child(1) > nav > section > ul") do
      expect(page).to have_content(category.name)
      expect(page).to have_content(subcategory.name)
      expect(page).to have_content(article.slug)
    end
  end
end
