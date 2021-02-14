class Page < ApplicationRecord
  belongs_to :profile
  validates_with PageValidator
  default_scope { order(active: :desc, updated_at: :desc) }

  scope :active, -> { where(active: true) }

  def active_page
    active.first
  end
end
