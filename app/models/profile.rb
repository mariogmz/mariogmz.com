class Profile < ApplicationRecord
  belongs_to :user
  has_many :pages

  def full_name
    "#{first_name} #{last_name}"
  end
end
