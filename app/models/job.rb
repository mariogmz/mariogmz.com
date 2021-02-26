class Job < ApplicationRecord
  belongs_to :profile
  has_one_attached :company_logo

  scope :current, -> { order(start_date: :desc).first }
end
