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

  def paginated_list(collection, period = "all")
    list = []
    list.push(content_tag(:div, pagination_info(collection), :class => "yui-g"))
    half = (collection.size + collection.size % 2) / 2
    li = { "left" => [], "right" => [] }
    for item in collection
      bucket = collection.index(item) < half ? "left" : "right"
      rel = case dom_class(item)
        when "article" : "?"
        when "author" : ["first", "middle", "last"].map {|pos| pluralize(item.send("#{period}_#{pos}"), "#{pos} author article")}.join(", ")
        when "subject" : ["major", "minor"].map {|type| pluralize(item.send("#{period}_#{type}"), "#{type} topic article")}.join(", ")
        else pluralize(item.send(period), "article")
      end
      articles = case dom_class(item)
        when "article" : ""
        when "author" : "#{pluralize(item.send("#{period}_total"), "article")}"
        when "subject" : "#{pluralize(item.send("#{period}_total"), "article")}"
        else "#{pluralize(item.send(period), "article")}"
      end
      articles_count = dom_class(item).match(/article/) ? "" : content_tag(:span, articles, :class => "articles_count")
      css_class = dom_class(item).match(/author|subject/) ? "tooltip" : ""
      li[bucket].push(content_tag(:li, link_to(item.to_s + articles_count, url_for(item), :rel => rel, :title => item.to_s, :class => css_class)))
    end
    column = []
    column.push(content_tag(:div, content_tag(:ul, li["left"].join("\n")), :class => "yui-u first"))
    column.push(content_tag(:div, content_tag(:ul, li["right"].join("\n")), :class => "yui-u"))
    list.push(content_tag(:div, column.join("\n"), :class => "yui-g"))
    list.push(content_tag(:div, will_paginate(collection), :class => "yui-g")) 
    list.join("\n")
  end

  def pagination_info(collection)
    content_tag :div, page_entries_info(collection), :class => "pagination_info"
  end
end
