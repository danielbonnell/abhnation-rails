class AddIndexToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :display_index, :integer, null: false, default: 1
  end
end
