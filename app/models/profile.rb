class Profile < ApplicationRecord
  belongs_to :user
  has_many :pages
  has_many :jobs
  has_many :skills
  has_many :soft_skills
  has_many :socials

  delegate :active_page, to: :pages

  after_update_commit { broadcast_replace_to self, partial: "admin/profiles/profile" }

  def full_name
    "#{first_name} #{last_name}"
  end
end
