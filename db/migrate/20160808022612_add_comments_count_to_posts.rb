class AddCommentsCountToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :comments_count, :integer, default: 0
  end
end
