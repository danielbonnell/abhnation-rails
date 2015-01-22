require 'rails_helper'

RSpec.describe Category, :type => :model do


  context 'moving parent category up or down once: ' do

    it 'UPx1: display_index decreases by 1 for category and increased by 1 for swap', focus: true do
      FactoryGirl.create(:category, name: "swap_cat", display_index: 1)
      category = FactoryGirl.create(:category, name: "cat", display_index: 2)

      category.reorder(-1)
      expect(Category.find_by(name: "cat").display_index).to eq(1)
      expect(Category.find_by(name: "swap_cat").display_index).to eq(2)
    end

    it 'DOWNx1: display_index increases by 1 for category and decreases by 1 for swap', focus: true do
      category = FactoryGirl.create(:category, name: "cat", display_index: 1)
      FactoryGirl.create(:category, name: "swap_cat", display_index: 2)

      category.reorder(1)
      expect(Category.find_by(name: "cat").display_index).to eq(2)
      expect(Category.find_by(name: "swap_cat").display_index).to eq(1)
    end
  end

  context 'moving parent category up or down twice: ' do

    it 'UPx2: display_index decreases by 2 for category and increased by 2 for swap', focus: true do
      FactoryGirl.create(:category, display_index: 0)
      FactoryGirl.create(:category, name: "swap_cat", display_index: 1)
      category = FactoryGirl.create(:category, name: "cat", display_index: 2)

      category.reorder(-1)
      category.reorder(-1)
      expect(Category.find_by(name: "cat").display_index).to eq(0)
      expect(Category.find_by(name: "swap_cat").display_index).to eq(2)
    end

    it 'DOWNx2: display_index increases by 2 for category and decreases by 2 for swap', focus: true do
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
end
