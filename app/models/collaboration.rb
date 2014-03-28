class Collaboration < ActiveRecord::Base
  belongs_to :user
  validates :desc, length: { minimum: 100 }
end
