class Category < ApplicationRecord
  has_many :skills, dependent: :nullify

  validates :order, uniqueness: true, numericality: { greater_than: 0 }

  after_create_commit { broadcast_prepend_to :categories, partial: "admin/categories/category" }
  after_update_commit { broadcast_replace_to :categories, partial: "admin/categories/category" }
  after_destroy_commit { broadcast_remove_to :categories }
end
