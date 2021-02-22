class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :url
      t.text :description
      t.references :page, null: false, foreign_key: true

      t.timestamps
    end
  end
end
