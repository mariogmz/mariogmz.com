module ApplicationHelper
  def icon(name, klass: "text-white", &block)
    inline_svg_pack_tag("media/icons/#{name}.svg", class: "w-6 h-6 #{klass}")
  end
end
