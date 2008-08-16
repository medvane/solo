# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def pagination_info(collection)
    content_tag :div, page_entries_info(collection), :class => "pagination_info"
  end
end
