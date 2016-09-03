class AddFacebookToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :facebook_id, :integer, limit: 8
    add_index :users, :facebook_id
  end
end
