class Service < ApplicationRecord
  belongs_to :page

  validates_presence_of :name, :description

  has_one_attached :image

  after_create_commit { broadcast_append_to :services, partial: "admin/services/service" }
  after_update_commit { broadcast_replace_to :services, partial: "admin/services/service" }
  after_destroy_commit { broadcast_remove_to :services }
end
