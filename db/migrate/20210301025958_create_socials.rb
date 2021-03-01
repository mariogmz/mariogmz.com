class CreateSocials < ActiveRecord::Migration[6.1]
  def change
    create_table :socials do |t|
      t.string :name
      t.string :url
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
