class AddCompletionAndSecondayUsersToCollabs < ActiveRecord::Migration
  def change
    add_column :collaborations, :complete, :boolean, default: false
  end
end
