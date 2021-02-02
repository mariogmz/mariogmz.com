class Page < ApplicationRecord
  belongs_to :profile
  scope :active, -> { where(active: true) }

  validates_with PageValidator
end
