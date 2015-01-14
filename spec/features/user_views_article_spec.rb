require 'rails_helper'

feature 'user views article', %{
  As a user, I want to view articles, so that I can learn more.
  Acceptance Criteria:
  * [X] - I can see the title, category or subcategory, text, and author
          (if included) of an article.
  * [X] - I can see the title, category, and subcategory of an article in the
          nav bar.
  } do

  let(:article) do
    FactoryGirl.create(:article)
  end

  scenario 'without authenticating' do
    visit article_path(article)

    within(:css, "body > div:nth-child(2) > ul") do
      expect(page).to have_content(article.subcategory.name)
      expect(page).to have_content(article.category.name)
    end

    within(:css, "body > div:nth-child(3) > div") do
      expect(page).to have_content(article.title)
      expect(page).to have_content(article.text)
      expect(page).to have_content(article.user.username)
    end

    within(:css, "body > div.row.collapse > nav > section > ul") do
      expect(page).to have_content(article.slug)
      expect(page).to have_content(article.category.name)
      expect(page).to have_content(article.subcategory.name)
    end
  end
end