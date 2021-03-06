class User < ActiveRecord::Base
  validates :username, :password_digest, :session_token, presence: true
  validates :username, :session_token, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}

  after_initialize :ensure_session_token!

  has_many :goals, dependent: :destroy

  has_many :goal_comments,
    class_name: 'GoalComment',
    foreign_key: :author_id,
    inverse_of: :author

  has_many :authored_user_comments,
    class_name: 'UserComment',
    foreign_key: :author_id,
    inverse_of: :author

  has_many :recieved_user_comments,
    class_name: 'UserComment',
    foreign_key: :user_id,
    inverse_of: :user


  attr_reader :password

  def self.genereate_session_token!
    SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    user.try(:is_password?, password) ? user : nil
  end

  def reset_session_token!
    self.session_token = User.genereate_session_token!
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
    password_digest
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  private
  def ensure_session_token!
    self.session_token ||= User.genereate_session_token!
  end
end
