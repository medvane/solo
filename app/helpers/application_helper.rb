module ApplicationHelper
  def paginated_list(collection)
    list = []
    list.push(pagination_info(collection)) 
    li = [] 
    for item in collection
      li.push(content_tag(:li, link_to(item.to_s, url_for(item)), :class => dom_class(item), :id => dom_id(item))) 
    end
    list.push(content_tag(:ul, li.join("\n")))
    list.push(will_paginate(collection)) 
    list.join("\n")
  end

  def pagination_info(collection)
    content_tag :div, page_entries_info(collection), :class => "pagination_info"
  end
end
