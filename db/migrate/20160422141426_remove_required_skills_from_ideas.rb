class RemoveRequiredSkillsFromIdeas < ActiveRecord::Migration
  def change
    remove_column :ideas, :required_skills
  end
end
