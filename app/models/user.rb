class User < ActiveRecord::Base
  acts_as_messageable
  has_many :collaborations, dependent: :destroy
  
  has_attached_file :avatar, :styles => { :profile => "200x200>", :collab => "300x200>", :msg => "50x50>", :thumb => "250x250>" }, :default_url => "missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
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

  validates :study_location, presence: true
  validates :experience, presence: true
  validates :travel_distance, presence: true

  validate :at_least_one_title_is_checked
  validate :at_least_one_study_topic_is_checked
  
  validates :password, presence: true, confirmation: true, length: { within: 6..40 }, on: :create
  validates :password, confirmation: true, length: { within: 6..40 }, on: :update, unless: lambda{ |user| user.password.blank? }

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

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def feed(user)
    User.all.sort_by { |user| user.match_rate(user) }
    #User.all.sort_by(&:match_rate(user))
  end

  def name
    "#{first_name} #{last_name}"
  end

  def mailboxer_email(object)
    email
  end

  def match_rate(current_user)
    rate = 0
    max = 26
    if current_user.is_teacher == is_teacher
      rate = rate + 1
    end
    if current_user.is_researcher == is_researcher
      rate = rate + 1
    end
    if current_user.is_student == is_student
      rate = rate + 1
    end
    if current_user.is_comm_member == is_comm_member
      rate = rate + 1
    end

    if current_user.s_animal == s_animal 
      rate = rate + 2
    end
    if current_user.s_children == s_children
      rate = rate + 2
    end
    if current_user.s_adults == s_adults
      rate = rate + 2
    end
    if current_user.s_environment == s_environment
      rate = rate + 2
    end
    if current_user.s_cells == s_cells
      rate = rate + 2
    end

    if current_user.i_obesity == i_obesity
      rate = rate + 2
    else
      puts "error5"

    end
    if current_user.i_diabetes == i_diabetes
      rate = rate + 2
    end
    if current_user.i_heart == i_heart
      rate = rate + 2
    end
    if current_user.i_violence_prevention == i_violence_prevention
      rate = rate + 2
    end
    if current_user.i_injury == i_injury
      rate = rate + 2
    end
    if current_user.i_falls == i_falls
      rate = rate + 2
    end
    return ((1.0*rate)/max * 100).round
  end

  private

  def create_remember_token
    self.remember_token = User.hash(User.new_remember_token)
  end

end
