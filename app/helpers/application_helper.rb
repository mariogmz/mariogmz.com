module ApplicationHelper
  def rounded_image_tag(source, options = {})
    options[:class] = ("#{options[:class]} object-contain rounded-full w-32 h-32 border-manatee border-2 shadow-md")
    image_tag(source, options)
  end

  def month_date(date)
    date.strftime("%B, %Y")
  end

  def date_range(start_date, end_date)
    end_label = end_date.nil? ? "date" : month_date(end_date)
    "From #{month_date(start_date)} to #{end_label}"
  end
end
