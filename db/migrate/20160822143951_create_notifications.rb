class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :actor_id 
      t.integer :recipient_id
      t.datetime :read_at
      t.integer :notifiable_id
      t.string :notifiable_type
      t.boolean :pristine, default: true
      t.string :action_type

      t.timestamps
    end

    add_index :notifications, :recipient_id
  end
end
