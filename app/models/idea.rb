class Idea < ActiveRecord::Base
  belongs_to :platform
  has_many :ideas_users
  has_many :users, through: :ideas_users
  validates :name, :description, :additional_info, :platform_id, :role_ids, presence: true

  serialize :role_ids

  def respond_users
    self.ideas_users.respond
  end

  def arr_name_respond(role)
    users.where(id: respond_users.pluck(:user_id), role_id: role.id).pluck(:name).join(', ')
  end

  def user_already_respond?(user_id)
    self.user_ids.include?(user_id)
  end

  def owner
    self.ideas_users.owner.try(:first).try(:user)
  end

  def can_respond?(role_id)
    self.role_ids.include?(role_id)
  end

  def arr_name_skill
    Role.where(id: role_ids).pluck(:name).join(', ')
  end
end

