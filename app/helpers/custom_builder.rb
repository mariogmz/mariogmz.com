class CustomBuilder < ActionView::Helpers::FormBuilder
  def file_field(method, options = {})
    @template.tag.div(class: "relative h-40 rounded-lg border-dashed border-2 border-manatee bg-white flex justify-center items-center") do
      @template.concat file_field_background(method)
      options[:class] = "h-full w-full opacity-0 cursor-pointer"
      @template.concat super(method, options)
    end
  end

  private

  def file_field_background(method)
    @template.tag.div(class: "absolute h-full w-full") do
      attachment = object.send(method)
      unless attachment.attached?
        @template.concat upload_instructions
      else
        @template.concat image_background(attachment)
      end
    end
  end

  def upload_instructions
    @template.tag.div(class: "flex flex-col items-center h-full justify-center") do
      @template.concat @template.icon "upload", klass: "text-manatee"
      @template.concat @template.tag.div(class: "text-manatee font-normal") { "Attach you files here" }
      @template.concat @template.tag.div(class: "text-manatee font-normal") { "or" }
      @template.concat @template.tag.div(class: "text-imperial-red font-normal") { "Browse files" }
    end
  end

  def image_background(attachment)
    image_url = attachment.variant(resize_to_limit: [400, 300]).processed
    style = "background-image: url(#{@template.rails_representation_url(image_url)});"
    @template.tag.div(style: style, class: "h-full w-full bg-cover bg-no-repeat bg-center")
  end
end
