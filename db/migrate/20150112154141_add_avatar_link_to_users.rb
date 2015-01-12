class AddAvatarLinkToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar_link, :string
  end
end
