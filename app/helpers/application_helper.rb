module ApplicationHelper
  def icon(name, &block)
    inline_svg_pack_tag("media/icons/#{name}.svg", class: "w-6 h-6 text-white")
  end
end
