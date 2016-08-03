class AddFilterToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :filter, :string
  end
end
