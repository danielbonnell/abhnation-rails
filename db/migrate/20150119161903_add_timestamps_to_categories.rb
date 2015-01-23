class AddTimestampsToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :created_at, :datetime, null: false, default: Time.now
    add_column :categories, :updated_at, :datetime, null: false, default: Time.now
  end
end
