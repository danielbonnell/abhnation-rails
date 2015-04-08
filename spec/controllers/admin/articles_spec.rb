require "rails_helper"

RSpec.describe Admin::ArticlesController, type: :controller do
  let(:article) do
    FactoryGirl.create(:article)
  end

  before(:each) do
    admin = FactoryGirl.create(:user, admin: true)
    allow_message_expectations_on_nil
    allow(request.env["warden"]).to receive(:authenticate!) { admin }
    allow(controller).to receive(:current_user) { admin }
  end

  describe "#index" do
    before(:each) do
      get :index
    end

    it "Is successful" do
      expect(response).to be_success
    end

    it "Returns renders template #index" do
      expect(response).to render_template("index")
    end
  end

  describe "#edit" do
    before(:each) do
      get :edit, id: article.id
    end

    it "Is successful" do
      expect(response).to be_success
    end

    it "Returns renders template #edit" do
      expect(response).to render_template("edit")
    end
  end

  describe "#update with valid attributes" do
    before(:each) do
      put :update, id: article, article: FactoryGirl.attributes_for(:article, :slug => "Test Article")
    end

    it "Is successful" do
      expect(response).to redirect_to(admin_article_path(article))
    end

    it "Updates article.slug" do
      expect(Article.last.slug).to eq("Test Article")
    end
  end

  describe "#update with invalid attributes" do
    before(:each) do
      # binding.pry
      xhr :patch, :update, id: article, article: FactoryGirl.attributes_for(:article, :slug => "This Slug is Way Too Long!"), format: :json
    end

    it "Is unsuccessful" do
      expect(response.code).to eq("422")
    end

    it "Updates article.slug" do
      expect(Article.last.slug).to_not eq("This Slug is Way Too Long!")
    end
  end

  describe "#destroy" do
    before(:each) do
      delete :destroy, id: article.id
    end

    it "Is successful" do
      expect(response).to redirect_to(admin_articles_path)
    end

    it "Removes user form DB" do
      expect(Article.all).not_to include article
      expect { article.reload }.to raise_exception ActiveRecord::RecordNotFound
    end
  end
end
