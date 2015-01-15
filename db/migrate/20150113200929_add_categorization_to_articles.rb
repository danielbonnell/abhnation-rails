class AddCategorizationToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :categorization_id, :integer, null: false, default: 1
  end
end
