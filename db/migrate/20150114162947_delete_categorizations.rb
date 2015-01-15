class DeleteCategorizations < ActiveRecord::Migration
  def change
    drop_table :categorizations do |t|
      t.integer :category_id
      t.integer :subcategory_id
      t.timestamps
    end

    drop_table :subcategories do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
      t.integer :category_id, null: false
    end
  end
end
