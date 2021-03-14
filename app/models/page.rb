class Page < ApplicationRecord
  belongs_to :profile
  has_many :services, dependent: :destroy
  has_many :projects, dependent: :destroy
  validates_with PageValidator
  default_scope { order(active: :desc, updated_at: :desc) }

  scope :active, -> { where(active: true) }

  has_one_attached :hero_image_big
  has_one_attached :hero_image_front
  has_one_attached :about_image
  has_one_attached :contact_image

  after_update_commit { broadcast_replace_to :pages, partial: "admin/jobs/job" }

  def active_page
    active.first
  end
end
