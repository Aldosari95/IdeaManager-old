class AddRoleIdsToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :role_ids, :string
  end
end
