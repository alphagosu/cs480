class AddPictureToCollabs < ActiveRecord::Migration
  def change
    add_attachment :collaborations, :picture
  end
end
