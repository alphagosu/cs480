class User < ActiveRecord::Base

STUDY = ["Animal models",
             "Children",
             "Adults",
             "Environment",
             "Cells/Tissues"]
INTERESTS = ["Obesity",
             "Diabetes/Sugar",
             "Heart disease",
             "Injury",
             "Violence prevention",
             "Falls" ]

  before_save { self.email = email.downcase }
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :country, presence: true
  validates :state, presence: true
  validates :county, presence: true
  has_many :collaborations
  has_secure_password
  validates :password, length: { minimum: 6}

  validates :study_location, presence: true
  validates :experience, presence: true
  validates :travel_distance, presence: true

  validate :at_least_one_title_is_checked
  validate :at_least_one_study_topic_is_checked
  validate :at_least_one_interest_is_checked

  def at_least_one_title_is_checked
    errors.add(:base, "Select at least one title.") unless is_researcher || is_teacher || is_student || is_comm_member
  end

  def at_least_one_study_topic_is_checked
    errors.add(:base, "Select at least one topic that you study.") unless s_animal || s_children || s_adults || s_environment || s_cells
  end

  def at_least_one_interest_is_checked
    errors.add(:base, "Select at least one interest.") unless i_obesity || i_diabetes || i_heart || i_injury || i_violence_prevention || i_falls
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.hash(User.new_remember_token)
  end

end
