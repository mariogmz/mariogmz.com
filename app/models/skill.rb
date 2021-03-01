class Skill < ApplicationRecord
  belongs_to :profile
  belongs_to :category, optional: true

  after_create_commit { broadcast_prepend_to :skills, partial: "admin/skills/skill" }
  after_update_commit { broadcast_replace_to :skills, partial: "admin/skills/skill" }
  after_destroy_commit { broadcast_remove_to :skills }
end
