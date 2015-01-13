class Subcategory < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :articles

  validates :name, presence: true, uniqueness: true, length: { in: 3..15 }
end
