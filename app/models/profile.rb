class Profile < ApplicationRecord
  belongs_to :user
  has_many :pages
  has_many :jobs
  has_many :skills

  delegate :active_page, to: :pages

  def full_name
    "#{first_name} #{last_name}"
  end
end
