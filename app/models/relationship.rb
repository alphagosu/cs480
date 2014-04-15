class Relationship < ActiveRecord::Base
  belongs_to :collab, class_name: "Collaboration"
  belongs_to :user, class_name: "User"
  validates :collab_id, presence: true
  validates :user_id, presence: true
end
