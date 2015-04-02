require 'rails_helper'

RSpec.describe User, :type => :model do
  context 'Create new user.' do
    let(:user) do
      FactoryGirl.create(
        :user,
        username: "Test1",
        admin: true,
        age: 26,
        first_name: "Lafiel",
        last_name: "Abriel",
        website: "http://www.abhnation.com/"
      )
    end

    it "Has uername: Test1." do
      expect(user.username).to eq("Test1")
    end

    it "Is an admin." do
      expect(user.admin).to eq(true)
    end

    it "Age is 26." do
      expect(user.age).to eq(26)
    end

    it "Has a website." do
      expect(user.website).to eq("http://www.abhnation.com/")
    end

    it "Has a first name." do
      expect(user.first_name).to eq("Lafiel")
    end

    it "Has a last name." do
      expect(user.last_name).to eq("Abriel")
    end
  end
end
