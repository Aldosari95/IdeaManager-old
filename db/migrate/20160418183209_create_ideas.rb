class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :name
      t.text :description
      t.string :required_skills
      t.string :additional_info
      t.integer :platform_id

      t.timestamps null: false
    end
  end
end


