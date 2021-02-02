class PageValidator < ActiveModel::Validator
  def validate(record)
    is_the_only_one_active(record)
  end

  private
    def is_the_only_one_active(record)
      if record.active && record.profile.pages.active.any?
        record.errors.add(:active, :not_unique)
      end
    end
end
