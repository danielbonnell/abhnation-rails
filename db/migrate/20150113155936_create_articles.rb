class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.string :text, null: false
      t.integer :category_id, null: false
      t.integer :subcategory_id
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
