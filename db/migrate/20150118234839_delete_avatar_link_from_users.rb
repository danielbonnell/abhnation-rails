class DeleteAvatarLinkFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :avatar_link, :string
  end
end
