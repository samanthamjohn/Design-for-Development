class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.string :skill_type
      t.boolean :looking_for
      t.integer :user_id
      t.timestamps
    end
  end
end
