class CreateLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :languages do |t|
      t.string :name
      t.string :level
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
