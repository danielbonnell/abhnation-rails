class Category < ActiveRecord::Base
  belongs_to :user
  has_many :categorizations
  has_many :subcategories

  validates :name, presence: true, uniqueness: true, length: { in: 3..15 }
end
