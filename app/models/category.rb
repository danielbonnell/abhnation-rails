class Category < ActiveRecord::Base
  belongs_to :user
  has_many :articles

  parents = []
  Category.where("id > 0").each { |user| parents << user.id.to_i }

  validates :name, presence: true, uniqueness: true, length: { in: 3..15 }

  if !parents.empty?
    validates :parent_id,
              numericality: { only_integer: true },
              allow_nil: true,
              inclusion: { in: parents[0]..parents[-1] }
  end
end
