module ApplicationHelper
  def period_tab
    periods = [ ["all", "all time"], ["one", "last 1 year"], ["five", "last 5 years"], ["ten", "last 10 years"] ]
    li = []
    periods.each do |p|
      period = p[0]
      text = p[1]
      li_class = controller.action_name == period ? "selected" : ""
      link_text = content_tag(:em, text)
      link = eval(period + "_" + controller.controller_name + "_path")
      li.push(content_tag(:li, link_to(link_text, link), :class => li_class))
    end
    content_tag(:ul, li.join("\n"), :class => "yui-nav")
  end

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
