module AdminHelper
  def current_profile
    current_user.profile
  end

  def icon(name, klass: "text-white", &block)
    inline_svg_pack_tag("media/icons/admin/#{name}.svg", class: "w-6 h-6 #{klass}")
  end

  def stars(amount)
    return if amount.nil?
    amount.times.each { concat icon("star-solid", klass: "text-yellow-300 inline-block") }
    nil
  end
end
