class IdeasUser < ActiveRecord::Base
  belongs_to :idea, dependent: :destroy
  belongs_to :user

  before_create :default_action_type

  enum action_type: { owner: 0, respond: 1 }

  private

  def default_action_type
    self.action_type = IdeasUser.action_types[:respond]
  end
end
