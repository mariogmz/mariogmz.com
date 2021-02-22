class RemoveAboutTextColumnFromPages < ActiveRecord::Migration[6.1]
  def change
    remove_column :pages, :about_text
  end
end
