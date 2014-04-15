class Collaboration < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  has_attached_file :picture, :styles => { :index=> "300x200>", :view => "500x500" }, :default_url => "/images/default_collab.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  validates :name, presence: true, uniqueness: true
  validates :desc, length: { minimum: 50 }
  validates :user_id, presence: true
#  has_many :relationships, foreign_key: "user_id", dependent: :destroy
#  has_many :users, through: :relationships, source: :user_id
  has_many :users, class_name: "Relationship", foreign_key: "collab_id"
  
  def user_collaborating?(user)
    relationships.find_by(user_id: user.id)
  end

  def user_collaborate(user)
    relationships.create!(user_id: user.id)
  end

  def remove_user(user)
    relationships.find_by(user_id: user.id).destroy
  end

end
