module AdminHelper
  def current_profile
    current_user.profile
  end
end
