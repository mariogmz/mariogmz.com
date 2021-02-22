class Project < ApplicationRecord
  belongs_to :page

  validates_presence_of :name, :description

  after_create_commit { broadcast_prepend_to :projects, partial: "admin/projects/project" }
  after_update_commit { broadcast_replace_to :projects, partial: "admin/projects/project" }
  after_destroy_commit { broadcast_remove_to :projects }
end
