class AddLocationToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :address, :string
    add_column :posts, :lat, :float
    add_column :posts, :lng, :float
  end
end
