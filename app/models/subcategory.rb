class Subcategory < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :categorizations

  validates :name, presence: true, uniqueness: true, length: { in: 3..15 }
  validates :category_id, presence: true, numericality: { only_integer: true }
end
