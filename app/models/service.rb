class Service < ApplicationRecord
  belongs_to :page

  validates_presence_of :name, :description

  after_create_commit { broadcast_prepend_to :services, partial: "admin/services/service" }
  after_update_commit { broadcast_replace_to :services, partial: "admin/services/service" }
  after_destroy_commit { broadcast_remove_to :services }
end
