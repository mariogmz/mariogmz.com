class Social < ApplicationRecord
  belongs_to :profile
  has_one_attached :icon

  validates_presence_of :name, :url

  after_create_commit { broadcast_prepend_to :socials, partial: "admin/socials/social" }
  after_update_commit { broadcast_replace_to :socials, partial: "admin/socials/social" }
  after_destroy_commit { broadcast_remove_to :socials }
end
