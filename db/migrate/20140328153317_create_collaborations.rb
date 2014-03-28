class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.string :name
      t.string :desc
      t.string :country
      t.string :state
      t.string :county

      t.timestamps
    end
  end
end
