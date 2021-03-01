class CustomBuilder < ActionView::Helpers::FormBuilder
  def file_field(method, options = {})
    attachment = object.send(method)
    @template.tag.div(class: "relative h-40 rounded-lg border-dashed border-2 border-manatee bg-white flex justify-center items-center", "data-controller": "file-input") do
      @template.concat remove_button(attachment)
      @template.concat file_field_background(attachment)
      options[:class] = "h-full w-full opacity-0 cursor-pointer"
      options["data-file-input-target"] = "input";
      options["data-action"] = "file-input#changeBackground";
      @template.concat super(method, options)
      @template.concat @template.hidden_field_tag "#{object.class.name.underscore}[#{method}_delete]", nil, "data-file-input-target": "deleteField"
    end
  end

  def date_select(method, options = {}, html_options = {})
    options[:order] = %i[day month year]
    super(method, options, html_options)
  end

  private

  def file_field_background(attachment)
    style = if attachment.attached?
      image_url = @template.url_for(attachment.variant(resize_to_limit: [400, 300]))
      "background-image: url(#{image_url});"
    else
      ""
    end
    @template.tag.div(class: "absolute h-full w-full bg-contain bg-no-repeat bg-center",
                      style: style,
                      "data-file-input-target": "background") do
      @template.concat upload_instructions(attachment)
    end
  end

  def upload_instructions(attachment)
    @template.tag.div(class: "flex flex-col h-full items-center justify-center #{ attachment.attached? ? 'hidden':'' }",
                      "data-file-input-target": "instructions") do
      @template.concat @template.icon "upload", klass: "text-manatee"
      @template.concat @template.tag.div(class: "text-manatee font-normal") { "Attach you files here" }
      @template.concat @template.tag.div(class: "text-manatee font-normal") { "or" }
      @template.concat @template.tag.div(class: "text-imperial-red font-normal") { "Browse files" }
    end
  end

  def remove_button(attachment)
    @template.tag.div(class: "absolute top-1 right-1 button-icon z-10 #{ attachment.attached? ? '':"hidden"}",
                      "data-file-input-target": "removeButton",
                      "data-action": "click->file-input#removeImage") do
      @template.icon "x"
    end
  end
end
