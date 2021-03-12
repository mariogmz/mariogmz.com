class Job < ApplicationRecord
  belongs_to :profile
  has_one_attached :company_logo

  validates_presence_of :company_name, :role, :start_date

  scope :current, -> { order(start_date: :desc).first }

  after_create_commit { broadcast_append_to :jobs, partial: "admin/jobs/job" }
  after_update_commit { broadcast_replace_to :jobs, partial: "admin/jobs/job" }
  after_destroy_commit { broadcast_remove_to :jobs }
end
