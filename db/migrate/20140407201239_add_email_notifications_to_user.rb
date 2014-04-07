class AddEmailNotificationsToUser < ActiveRecord::Migration
  def change
    add_column :users, :notify_new_message, :boolean, default: true
    add_column :users, :notify_new_collab, :boolean, default: true
    add_column :users, :notify_collab_percent, :integer, default: 70
  end
end
