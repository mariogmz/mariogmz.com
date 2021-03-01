class CreateSoftSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :soft_skills do |t|
      t.string :name
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
