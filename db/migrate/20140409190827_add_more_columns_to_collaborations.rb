class AddMoreColumnsToCollaborations < ActiveRecord::Migration
  def change
    add_column :collaborations, :stage, :string
    add_column :collaborations, :n_funding, :boolean
    add_column :collaborations, :n_study_partners, :boolean
    add_column :collaborations, :n_space, :boolean
    add_column :collaborations, :n_areas_of_expertise, :boolean
    add_column :collaborations, :n_previous_work, :boolean
    add_column :collaborations, :n_expertise, :string
  end
end
