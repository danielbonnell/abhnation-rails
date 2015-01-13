class Categorization < ActiveRecord::Base
  belongs_to :category
  belongs_to :subcategory
  # has_many :galleries
  has_many :categories

  validates :category_id, numericality: { only_integer: true }
  validates :subcategory_id, numericality: { only_integer: true }
end
