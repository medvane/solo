module ApplicationHelper
  def publication_history(data)
    years = data.map {|d| d == data.first || d == data.last ? d.year : ""}
    articles = data.map {|d| d.articles }
    article_max = number_with_delimiter(articles.sort.last)
    bar_chart(articles, years, article_max)
  end
  
  def bar_chart(data, x_axis_label, y_axis_max, legend = nil)
    width = x_axis_label.size * 10 + 50
    width += 70 unless legend.nil?
    colors = case data.size
      when 2: "000066,999999"
      when 3: "660000,999999,000066"
      else "999999"
    end
    Gchart.bar(:data => data, :axis_labels => [x_axis_label, [0, y_axis_max]], :bar_colors => colors, :legend => legend, :size => "#{width}x50", :axis_with_labels => 'x,y', :bar_width_and_spacing => {:width => 6, :spacing => 4}, :format => 'image_tag', :alt => "publication history")
  end

  def period_tab(id = nil)
    periods = [ ["all", "all time"], ["one", "last 1 year"], ["five", "last 5 years"], ["ten", "last 10 years"] ]
    li = []
    periods.each do |p|
      period_key = p[0]
      period_val = p[1]
      li_class = controller.action_name == period_key ? "selected" : ""
      link_text = content_tag(:em, period_val)
      link = case id
        when nil: eval(period_key + "_" + controller.controller_name + "_path")
        else eval(period_key + "_" + controller.controller_name.singularize + "_path")
      end
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
      articles_count = dom_class(item).match(/article/) ? "" : content_tag(:span, number_with_delimiter(articles), :class => "articles_count")
      css_class = dom_class(item).match(/author|subject/) ? "tooltip" : ""
      li[bucket].push(content_tag(:li, link_to(item.to_s + articles_count, url_for(item) + "/#{period}", :rel => rel, :title => item.to_s, :class => css_class)))
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
