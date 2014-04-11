class AddUserIdToCollaborations < ActiveRecord::Migration
  def change
    add_column :collaborations, :user_id, :integer

    add_index :collaborations, [:user_id, :created_at]
  end
end
