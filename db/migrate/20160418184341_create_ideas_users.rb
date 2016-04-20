class CreateIdeasUsers < ActiveRecord::Migration
  def change
    create_table :ideas_users do |t|
      t.references :user, index: true
      t.references :idea, index: true
      t.integer   :action_type
    end
    add_foreign_key :ideas_users, :users
    add_foreign_key :ideas_users, :ideas
  end
end
