class Profile < ApplicationRecord
  belongs_to :user
  has_many :pages

  delegate :active_page, to: :pages

  def full_name
    "#{first_name} #{last_name}"
  end
end
