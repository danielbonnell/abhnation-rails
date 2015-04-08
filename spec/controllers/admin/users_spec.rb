require "rails_helper"

RSpec.describe Admin::UsersController, type: :controller do
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
      user = FactoryGirl.create(:user)
      get :edit, id: user.id
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
      user = FactoryGirl.create(:user)
      put :update, { id: user, user: FactoryGirl.attributes_for(:user, :username => "Test")}
    end

    it "Is successful" do
      expect(response).to redirect_to(admin_users_path)
    end

    it "Updates user.username" do
      expect(User.last.username).to eq("Test")
    end
  end

  describe "#update with invalid attributes" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      put :update, { id: @user, user: FactoryGirl.attributes_for(:user, :email => "Test")}
    end

    it "Is unsuccessful" do
      expect(response).to redirect_to(edit_admin_user_path(@user))
    end

    it "Updates user.username" do
      expect(User.last.email).to_not eq("Test")
    end
  end

  describe "#destroy" do
    let(:user) do
      user = FactoryGirl.create(:user)
    end

    before(:each) do
      delete :destroy, id: user.id
    end

    it "Is successful" do
      expect(response).to redirect_to(admin_users_path)
    end

    it "Removes user form DB" do
      expect(User.all).not_to include user
      expect { user.reload }.to raise_exception ActiveRecord::RecordNotFound
    end
  end
end
