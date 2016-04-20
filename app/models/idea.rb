class Idea < ActiveRecord::Base
  belongs_to :platform
  has_many :ideas_users
  has_many :users, through: :ideas_users
  validates :name, :description, :required_skills, :additional_info, :platform_id, presence: true

  def respond_users
    self.ideas_users.respond
  end

  def arr_name_respond_designer
    users.designers.where(id: respond_users.pluck(:user_id)).pluck(:name).join(', ')
  end

  def arr_name_respond_developer
    users.developers.where(id: respond_users.pluck(:user_id)).pluck(:name).join(', ')
  end

  def user_already_respond?(user_id)
    self.user_ids.include?(user_id)
  end

  def owner
    self.ideas_users.owner.first.user
  end
end

