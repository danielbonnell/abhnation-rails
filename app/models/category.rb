class Category < ActiveRecord::Base
  belongs_to :user
  has_many :articles
  belongs_to :parent,
    foreign_key: 'parent_id',
    class_name: 'Category'

  has_many :subcategories,
    foreign_key: 'parent_id',
    class_name: 'Category'

  validates :name, presence: true, uniqueness: true, length: { in: 3..16 }

  validate :only_one_level_deep
  validates :parent_id,
    numericality: { only_integer: true },
    allow_nil: true

  def self.cat_parents
    where("parent_id is NULL")
  end

  # def subcategories
  #   Category.where(parent_id: self.id)
  # end
  #
  # def articles
  #   Article.where(category_id: self.id)
  # end

  protected
  def only_one_level_deep
    if self.parent && self.parent.parent_id.present?
      self.errors.add(:parent_id, 'cannot be a subcategory')
    end
  end
end
