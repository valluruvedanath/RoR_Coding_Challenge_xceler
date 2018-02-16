class CreateEventSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :event_subscriptions do |t|
      t.integer :event_id
      t.integer :user_id
      t.boolean :is_intrested

      t.timestamps
    end
  end
end
