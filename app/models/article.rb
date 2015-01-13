class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :subcategory

  validates :title, presence: true, uniqueness: true, length: { in: 3..100 }
  validates :slug, presence: true, uniqueness: true, length: { in: 3..15 }
  validates :text, presence: true, length: { in: 100..10000 }
  validates :category_id, presence: true, numericality: { only_integer: true }
  validates :subcategory_id, numericality: { only_integer: true }
end
