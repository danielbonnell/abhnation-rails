require 'rails_helper'

RSpec.describe Category, :type => :model do


  context 'moving category up' do

    it 'display_index decreases by 1', focus: true do
      category = FactoryGirl.create(:category, display_index: 2)
      swap_category = FactoryGirl.create(:category, display_index: 1)

      category.up_index
      expect(category.display_index).to eq(1)
    end

    # it 'display_index of swap category increases by 1' do
    #
    # end
  end
end
