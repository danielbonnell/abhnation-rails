require 'rails_helper'

feature 'user views article', %Q{
  As an authenticated user, I want to view restricted articles, so that I can learn more.
  Acceptance Criteria:
  * [X] - I can’t see a link to the article in the nav bar unless I have authenticated.
  * [X] - If I navigate to the path of the article I see a 404 error unless I have authenticated.
  * [X] - I can see the title, category or subcategory, text, and author (if included) of an article if I have authenticated.
  } do

  let(:category) do
    FactoryGirl.create(:category)
  end

  let(:subcategory) do
    FactoryGirl.create(:category, parent_id: category.id)
  end

  let(:article) do
    FactoryGirl.create(:article, category: subcategory)
  end

  scenario 'after authenticating' do
    log_in_as(article.user)
    visit [category, article]
    subcat = Category.find(article.category.parent_id).name

    within(:css, "body > div:nth-child(2) > ul") do
      expect(page).to have_content(subcat)
      expect(page).to have_content(article.category.name)
    end

    within(:css, "body > div:nth-child(3) > div") do
      expect(page).to have_content(article.title)
      expect(page).to have_content(article.text)
      expect(page).to have_content(article.user.username)
    end

    within(:css, "body > div.row.collapse > nav > section > ul") do
      expect(page).to have_content(article.category.name)
      expect(page).to have_content(subcat)
      expect(page).to have_content(article.slug)
    end
  end

  scenario 'without authenticating' do
    visit [category, article]

    within(:css, "body > div:nth-child(2) > ul") do
      expect(page).to have_content(article.slug)
    end

    within(:css, "body > div:nth-child(3) > div") do
      expect(page).to have_content(article.title)
      expect(page).to have_content(article.text)
    end

    within(:css, "body > div.row.collapse > nav > section > ul") do
      expect(page).to have_content(article.slug)
    end
  end
end
