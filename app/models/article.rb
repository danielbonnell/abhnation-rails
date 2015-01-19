class Article < ActiveRecord::Base
  paginates_per 10
  max_paginates_per 50
  belongs_to :user
  belongs_to :category
  belongs_to :subcategory

  validates :title, presence: true, uniqueness: true, length: { in: 3..100 }
  validates :slug, presence: true, uniqueness: true, length: { in: 3..16 }
  validates :text, presence: true, length: { in: 100..10000 }
  validates :category_id, presence: true, numericality: { only_integer: true }
end
