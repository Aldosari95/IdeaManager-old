class Idea < ActiveRecord::Base
  belongs_to :platform
  belongs_to :user
  has_and_belongs_to_many :users, :class_name => "User", :join_table => "ideas_users"
  validates :name, :description, :required_skills, :additional_info, :platform_id, :user_id, presence: true

  def arr_name_designer
    self.users.designers.pluck(:name).join(', ')
  end

  def arr_name_developer
    self.users.developers.pluck(:name).join(', ')
  end

  def user_already_respond?(user_id)
    self.user_ids.include?(user_id)
  end
end

