require "rails_helper"

RSpec.describe Admin::CategoriesController, type: :controller do
  let(:category) do
    FactoryGirl.create(:category)
  end

  before(:each) do
    admin = FactoryGirl.create(:user, admin: true)
    allow_message_expectations_on_nil
    allow(request.env["warden"]).to receive(:authenticate!) { admin }
    allow(controller).to receive(:current_user) { admin }
  end

  describe "#create" do
    before(:each) do
      new_category = FactoryGirl.build(:category)
      post :create, category: new_category.attributes
    end

    it "Is successful" do
      expect(response.code).to eq("302")
    end

    it "Returns renders template #index" do
      expect(response).to redirect_to(admin_categories_path)
    end
  end

  describe "#update with valid attributes" do
    before(:each) do
      put :update, id: category.id, category: FactoryGirl.attributes_for(:category, :name => "Test Category")
    end

    it "Is successful" do
      expect(response).to redirect_to(admin_categories_path)
    end

    it "Updates category.name" do
      expect(Category.last.name).to eq("Test Category")
    end
  end

  describe "#update with invalid attributes" do
    before(:each) do
      xhr :put, :update, id: category.id, category: FactoryGirl.attributes_for(:category, :name => "This Name is Way Too Long!"), format: :json
    end

    it "Is unsuccessful" do
      expect(response.code).to eq("422")
    end

    it "Updates category.name" do
      expect(Category.last.name).to_not eq("This Name is Way Too Long!")
    end
  end

  describe "#destroy" do
    before(:each) do
      delete :destroy, id: category.id
    end

    it "Is successful" do
      expect(response).to redirect_to(admin_categories_path)
    end

    it "Removes category form DB" do
      expect(Category.all).not_to include category
      expect { category.reload }.to raise_exception ActiveRecord::RecordNotFound
    end
  end
end
