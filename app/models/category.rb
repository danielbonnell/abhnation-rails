class Category < ActiveRecord::Base
  paginates_per 10
  max_paginates_per 50
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

  validates :display_index,
    presence: true,
    numericality: { only_integer: true }

  def reorder(index_param)
    if self.parent.nil?
      if index_param == -1
        swap_cat = Category.cat_parents.where("display_index < ?", self.display_index).last
        swap_cat_index = swap_cat.display_index
        cat_index = self.display_index
        self.update(display_index: swap_cat_index)
        swap_cat.update(display_index: cat_index) unless swap_cat_index.nil?
      else
        swap_cat = Category.cat_parents.where("display_index > ?", self.display_index).first
        swap_cat_index = swap_cat.display_index
        cat_index = self.display_index
        # binding.pry
        self.update(display_index: self.display_index + 1)
        swap_cat.update(display_index: swap_cat_index - 1) unless swap_cat_index.nil?
      end
    else
      if index_param == -1

      else

      end
    end

    # if self.parent.nil? && index_param == 1
    #   prime_cat_index = self.display_index + 1
    #   swap_cat = Category.cat_parents.where("display_index <= ?", prime_cat_index + 1).first
    #   swap_cat_index = swap_cat.display_index - 1
    # elsif self.parent.nil? && index_param == -1
    #   prime_cat_index = self.display_index - 1
    #   swap_cat = Category.cat_parents.where("display_index >= ?", prime_cat_index - 1).first
    #   swap_cat_index = swap_cat.display_index + 1
    # elsif !self.parent.nil? && index_param == 1
    #   prime_cat_index = self.display_index + 1
    #   swap_cat = Category.where("parent_id is not NULL and display_index <= ?", prime_cat_index + 1).first
    #   swap_cat_index = swap_cat.display_index - 1
    # elsif !self.parent.nil? && index_param == -1
    #   prime_cat_index = self.display_index - 1
    #   swap_cat = Category.where("parent_id is not NULL and display_index >= ?", prime_cat_index - 1).first
    #   swap_cat_index = swap_cat.display_index + 1
    # end
  end

  def self.cat_names_dropdown
    cat_hash = {}
    self.all.each do |category|
      if category.parent_id.nil?
        cat_hash[category.id] = category.name
      else
        cat_hash[category.id] = "└#{category.name}"
      end
    end
    return cat_hash
  end

  def self.cat_parents
    where("parent_id is NULL")
  end

  def dependents?
    self.all.subcategories.each do |subcategory|
      return true unless subcategory.articles.empty?
    end

    return true unless self.subcategories.empty? && self.articles.empty?
  end

  protected
  def only_one_level_deep
    if self.parent && !self.parent.parent.nil?
      self.errors.add(:parent_id, 'cannot be a subcategory')
    end
  end
end
