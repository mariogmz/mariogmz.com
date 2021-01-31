class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :role
      t.string :location
      t.boolean :visa
      t.boolean :realocation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
