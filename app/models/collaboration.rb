class Collaboration < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :desc, length: { minimum: 50 }
  validates :user_id, presence: true
end
