class ChangeStudyFieldsToBooleans < ActiveRecord::Migration
  def change
    change_column :users, :s_animal, :boolean, default: :false
    change_column :users, :s_children, :boolean, default: :false
    change_column :users, :s_adults, :boolean, default: :false
    change_column :users, :s_environment, :boolean, default: :false
    change_column :users, :s_cells, :boolean, default: :false
  end
end
