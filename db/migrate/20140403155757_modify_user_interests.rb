class ModifyUserInterests < ActiveRecord::Migration
  def change
    remove_column :users, :study
    add_column :users, :s_animal, :string
    add_column :users, :s_children, :string
    add_column :users, :s_adults, :string
    add_column :users, :s_environment, :string
    add_column :users, :s_cells, :string
  end

end
