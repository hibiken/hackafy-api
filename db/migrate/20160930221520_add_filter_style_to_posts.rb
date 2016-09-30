class AddFilterStyleToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :filter_style, :json
  end
end
