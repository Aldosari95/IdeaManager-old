class User < ActiveRecord::Base
  belongs_to :role
  has_many :ideas, dependent: :destroy
  has_and_belongs_to_many :ideas, :class_name => "Idea", :join_table => "ideas_users"
  validates :name, :email, :password, :role_id, presence: true
  validates :email, uniqueness: true
  validates :admin, default:false
  before_save :ensure_email_is_lowercase

  scope :designers, -> { where role_id: Role.find_by(name: "Designer").id }
  scope :developers, -> { where role_id: Role.find_by(name: "Developer").id }

  def ensure_email_is_lowercase
    email.downcase!
  end

  def is_owner?(user_id)
    self.id == user_id
  end

end
