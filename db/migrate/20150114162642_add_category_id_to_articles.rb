class AddCategoryIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :category_id, :integer, null: false, default: 1
    remove_column :articles, :categorization_id, :integer, null: false, default: 1
    add_column :categories, :parent_id, :integer
  end
end
