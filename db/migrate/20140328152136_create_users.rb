class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :country
      t.string :state
      t.string :county

      t.timestamps
    end
  end
end
