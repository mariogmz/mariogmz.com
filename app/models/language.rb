class Language < ApplicationRecord
  belongs_to :profile

  after_create_commit { broadcast_prepend_to :languages, partial: "admin/languages/language" }
  after_update_commit { broadcast_replace_to :languages, partial: "admin/languages/language" }
  after_destroy_commit { broadcast_remove_to :languages }
end
