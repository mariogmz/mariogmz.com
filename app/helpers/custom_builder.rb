class CustomBuilder < ActionView::Helpers::FormBuilder
  def file_field(method, options = {})
    @template.tag.div(class: "relative h-40 rounded-lg border-dashed border-2 border-manatee bg-white flex justify-center items-center") do
      @template.concat(@template.tag.div(class: "absolute") do
        @template.tag.div(class: "flex flex-col items-center") do
          @template.concat @template.icon "upload", klass: "text-manatee"
          @template.concat @template.tag.span(class: "block text-manatee font-normal") { "Attach you files here" }
          @template.concat @template.tag.span(class: "block text-manatee font-normal") { "or" }
          @template.concat @template.tag.span(class: "block text-imperial-red font-normal") { "Browse files" }
        end
      end)
      options[:class] = "h-full w-full opacity-0 cursor-pointer"
      @template.concat super(method, options)
    end
  end
end
