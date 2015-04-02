require 'rails_helper'

RSpec.describe Category, :type => :model do
  context "Create a new category" do
    let(:category) do
      FactoryGirl.create(
        :category,
        name: "Test Category",
        parent_id: 30
      )
    end

    it "To have a name." do
      expect(category.name).to eq("Test Category")
    end

    it "To have a display index." do
      expect(category.display_index).to eq(1)
    end

    it "To belong to a parent category." do
      expect(category.parent_id).to eq(30)
    end

    it "To belong to a user." do
      expect(category.user).to_not eq(nil)
    end
  end

  context 'moving parent category up or down once: ' do
    it 'UPx1: display_index decreases by 1 for category and increased by 1 for swap' do
      FactoryGirl.create(:category, name: "swap_cat", display_index: 1)
      category = FactoryGirl.create(:category, name: "cat", display_index: 2)

      category.reorder(-1)
      expect(Category.find_by(name: "cat").display_index).to eq(1)
      expect(Category.find_by(name: "swap_cat").display_index).to eq(2)
    end

    it 'DOWNx1: display_index increases by 1 for category and decreases by 1 for swap' do
      category = FactoryGirl.create(:category, name: "cat", display_index: 1)
      FactoryGirl.create(:category, name: "swap_cat", display_index: 2)

      category.reorder(1)
      expect(Category.find_by(name: "cat").display_index).to eq(2)
      expect(Category.find_by(name: "swap_cat").display_index).to eq(1)
    end
  end

  context 'moving parent category up or down twice: ' do
    it 'UPx2: display_index decreases by 2 for category and increased by 2 for swap' do
      FactoryGirl.create(:category, display_index: 0)
      FactoryGirl.create(:category, name: "swap_cat", display_index: 1)
      category = FactoryGirl.create(:category, name: "cat", display_index: 2)

      category.reorder(-1)
      category.reorder(-1)
      expect(Category.find_by(name: "cat").display_index).to eq(0)
      expect(Category.find_by(name: "swap_cat").display_index).to eq(2)
    end

    it 'DOWNx2: display_index increases by 2 for category and decreases by 2 for swap' do
      first = FactoryGirl.create(:category, name: "first_cat", display_index: 0)
      second = FactoryGirl.create(:category, name: "second_cat", display_index: 1)
      third = FactoryGirl.create(:category, name: "third_cat", display_index: 2)

      first.reorder(1)
      first.reorder(1)
      expect(Category.find_by(name: "first_cat").display_index).to eq(2)
      expect(Category.find_by(name: "second_cat").display_index).to eq(0)
      expect(Category.find_by(name: "third_cat").display_index).to eq(1)
    end
  end

  context 'moving child category up or down once: ' do
    it 'UPx1: display_index decreases by 1 for category and increased by 1 for swap' do
      FactoryGirl.create(:category, name: "swap_cat", display_index: 1)
      category = FactoryGirl.create(:category, name: "cat", display_index: 2)

      category.reorder(-1)
      expect(Category.find_by(name: "cat").display_index).to eq(1)
      expect(Category.find_by(name: "swap_cat").display_index).to eq(2)
    end

    it 'DOWNx1: display_index increases by 1 for category and decreases by 1 for swap' do
      category = FactoryGirl.create(:category, name: "cat", display_index: 1)
      FactoryGirl.create(:category, name: "swap_cat", display_index: 2)

      category.reorder(1)
      expect(Category.find_by(name: "cat").display_index).to eq(2)
      expect(Category.find_by(name: "swap_cat").display_index).to eq(1)
    end
  end

  context 'moving child category up or down twice: ' do
    it 'UPx2: display_index decreases by 2 for category and increased by 2 for swap' do
      parent = FactoryGirl.create(:category)
      FactoryGirl.create(:category, display_index: 0, parent: parent)
      FactoryGirl.create(:category, name: "swap_cat", display_index: 1, parent: parent)
      category = FactoryGirl.create(:category, name: "cat", display_index: 2, parent: parent)

      category.reorder(-1)
      category.reorder(-1)
      expect(Category.find_by(name: "cat").display_index).to eq(0)
      expect(Category.find_by(name: "swap_cat").display_index).to eq(2)
    end

    it 'DOWNx2: display_index increases by 2 for category and decreases by 2 for swap' do
      parent = FactoryGirl.create(:category)
      first = FactoryGirl.create(:category, name: "first_cat", display_index: 0, parent: parent)
      second = FactoryGirl.create(:category, name: "second_cat", display_index: 1, parent: parent)
      third = FactoryGirl.create(:category, name: "third_cat", display_index: 2, parent: parent)

      first.reorder(1)
      first.reorder(1)
      expect(Category.find_by(name: "first_cat").display_index).to eq(2)
      expect(Category.find_by(name: "second_cat").display_index).to eq(0)
      expect(Category.find_by(name: "third_cat").display_index).to eq(1)
    end
  end
end
