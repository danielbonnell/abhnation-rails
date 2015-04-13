require "rails_helper"

RSpec.describe ArticlesController, type: :controller do
  let(:article) do
    FactoryGirl.create(:article)
  end

  describe "#show" do
    before(:each) do
      get :show, id: article.id, category_id: article.category.id
    end

    it "Is successful" do
      expect(response).to be_successful
    end

    it "Renders template #show" do
      expect(response).to render_template("show")
    end

    it "Returns valid category" do
      expect(Article.last).to eq(article)
    end
  end
end
