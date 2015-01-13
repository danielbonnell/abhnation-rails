class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :categorization
  
  def category
    categorization.category
  end

  def subcategory
    categorization.subcategory
  end

  validates :title, presence: true, uniqueness: true, length: { in: 3..100 }
  validates :slug, presence: true, uniqueness: true, length: { in: 3..15 }
  validates :text, presence: true, length: { in: 100..10000 }
  validates :categorization_id, presence: true, numericality: { only_integer: true }
end
