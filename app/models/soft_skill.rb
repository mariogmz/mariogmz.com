class SoftSkill < ApplicationRecord
  belongs_to :profile
  has_one_attached :icon

  validates_presence_of :name

  after_create_commit { broadcast_append_to :soft_skills, partial: "admin/soft_skills/soft_skill" }
  after_update_commit { broadcast_replace_to :soft_skills, partial: "admin/soft_skills/soft_skill" }
  after_destroy_commit { broadcast_remove_to :soft_skills }
end
