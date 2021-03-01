module ApplicationHelper
  def icon(name, klass: "text-white", &block)
    inline_svg_pack_tag("media/icons/#{name}.svg", class: "w-6 h-6 #{klass}")
  end

  def rounded_image_tag(source, options = {})
    options[:class] = ("#{options[:class]} object-contain rounded-full w-32 h-32 border-manatee border-2 shadow-md")
    image_tag(source, options)
  end

  def stars(amount)
    return if amount.nil?
    amount.times.each { concat icon("star-solid", klass: "text-yellow-300 inline-block") }
    nil
  end
end
