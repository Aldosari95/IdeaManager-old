class AddRoleIdsToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :role_ids, :integer, array: true, default: []
  end
end
