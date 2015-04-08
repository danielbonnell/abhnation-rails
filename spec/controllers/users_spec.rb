require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe 'GET #show' do
    let(:user) do
      FactoryGirl.create(:user)
    end

    before(:each) do
      get :show, id: user
    end

    it "Is successful" do
      expect(response).to be_success
    end

    it "Returns renders template #show" do
      expect(response).to render_template("show")
    end

    it "Returns valid user" do
      expect(User.last).to eq(user)
    end
  end
end
