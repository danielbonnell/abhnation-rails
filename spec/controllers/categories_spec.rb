require "rails_helper"

RSpec.describe CategoriesController, type: :controller do
  let(:category) do
    FactoryGirl.create(:category)
  end

  describe "#show" do
    before(:each) do
      get :show, id: category.id
    end

    it "Is successful" do
      expect(response).to be_successful
    end

    it "Renders template #show" do
      expect(response).to render_template("show")
    end

    it "Returns valid category" do
      expect(Category.last).to eq(category)
    end
  end
end
