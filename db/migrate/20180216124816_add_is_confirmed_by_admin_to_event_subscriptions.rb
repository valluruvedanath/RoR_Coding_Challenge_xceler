class AddIsConfirmedByAdminToEventSubscriptions < ActiveRecord::Migration[5.0]
  def change
    add_column :event_subscriptions, :is_confirmed_by_admin, :boolean
    add_column :event_subscriptions, :is_removed_by_admin, :boolean
  end
end
