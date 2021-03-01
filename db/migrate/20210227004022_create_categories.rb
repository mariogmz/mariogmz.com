class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.integer :order
      t.string :name

      t.timestamps
    end
  end
end
