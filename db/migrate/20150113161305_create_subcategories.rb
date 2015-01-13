class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
      t.integer :category_id, null: false
    end
  end
end
