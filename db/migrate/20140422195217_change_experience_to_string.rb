class ChangeExperienceToString < ActiveRecord::Migration
  def change
    change_column :users, :experience, :string
  end
end
