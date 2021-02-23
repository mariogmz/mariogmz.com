class Page < ApplicationRecord
  belongs_to :profile
  has_many :services, dependent: :destroy
  has_many :projects, dependent: :destroy
  validates_with PageValidator
  default_scope { order(active: :desc, updated_at: :desc) }

  scope :active, -> { where(active: true) }

  has_one_attached :hero_image
  has_one_attached :about_image
  has_one_attached :contact_image

  def active_page
    active.first
  end
end
