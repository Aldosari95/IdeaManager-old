class Idea < ActiveRecord::Base
  belongs_to :platform
  validates :name, :description, :required_skills, :additional_info, :platform_id, presence: true
end

