require 'rails_helper'

feature 'user views article', %Q{
  As an authenticated user, I want to view restricted articles, so that I can learn more.
  Acceptance Criteria:
  * [X] - I can’t see a link to the article in the nav bar unless I have authenticated.
  * [X] - If I navigate to the path of the article I see a 404 error unless I have authenticated.
  * [X] - I can see the title, category or subcategory, text, and author (if included) of an article if I have authenticated.
  } do

  let(:article) do
    FactoryGirl.create(:article)
  end
  
  scenario 'after authenticating' do
    log_in_as(article.user)
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

  scenario 'without authenticating' do
    visit article_path(article)

    expect(page).to have_content("The Abh Nation")
    expect(page).to have_content("404: Not Found")
  end
end
