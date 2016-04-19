class User < ActiveRecord::Base
  belongs_to :role
  validates :name, :email, :password, :role_id, presence: true
  validates :email, uniqueness: true
  validates :admmin, default:false
  before_save :ensure_email_is_lowercase

  def ensure_email_is_lowercase
    email.downcase!
  end

end
