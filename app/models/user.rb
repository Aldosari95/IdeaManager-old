class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password

  belongs_to :role
  has_many :ideas_users, dependent: :destroy
  has_many :ideas, dependent: :destroy, through: :ideas_users

  validates :name, :email, :password, :role_id, presence: true
  validates :email, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, confirmation: true
  validates :name, length: { maximum: 50 }
  validates :admin, default: false
  before_save :ensure_email_is_lowercase

  def ensure_email_is_lowercase
    email.downcase!
  end

  def is_owner?(user_id)
    self.id == user_id
  end

end
