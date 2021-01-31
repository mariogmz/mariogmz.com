class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.text :summary
      t.string :about_title, default: "About me"
      t.string :about_text
      t.string :services_title, default: "My Services"
      t.string :projects_title, default: "Portfolio"
      t.string :contact_title, default: "Contact me"
      t.string :contact_number
      t.boolean :active, default: false
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
