class DeleteCategoriesFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :category_id, :integer, null: false, default: 1
    remove_column :articles, :subcategory_id, :integer, null: false, default: 1
  end
end
