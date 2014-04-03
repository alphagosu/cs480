class AddInterestFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :i_obesity, :boolean, default: false
    add_column :users, :i_diabetes, :boolean, default: false
    add_column :users, :i_heart, :boolean, default: false
    add_column :users, :i_injury, :boolean, default: false
    add_column :users, :i_violence_prevention, :boolean, default: false
    add_column :users, :i_falls, :boolean, default: false
  end
end
