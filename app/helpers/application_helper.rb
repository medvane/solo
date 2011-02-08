module ApplicationHelper
  
  def neighbors(item, period = 'all')
    content = []
    for neighbor in %w(journals authors coauthors subjects genes pubtypes)
      if item.respond_to?(neighbor)
        object = item.send(neighbor).period(period, 5)
        objects = []
        object.each do |o|
          oo = o.send(neighbor.singularize)
          name = oo.to_s
          articles = 0
          if o.respond_to?("#{period}_total")
            articles = o.send("#{period}_total")
          elsif o.respond_to?(period)
            articles = o.send(period)
          end
          articles_count = content_tag(:span, pluralize(articles, "article"), :class => "articles_count")
          title = link_title(o, period)
          objects.push(content_tag(:li, link_to(name, url_for(oo) + "/#{period}", :title => title) + articles_count))
        end
        content.push("<h2>Top #{neighbor.capitalize}</h2>" + content_tag(:ul, objects.join("\n").html_safe)) if objects.size > 0
      end
    end
    content_tag :div, columns(content).html_safe, :id => "neighbors"
  end
  
  def publication_history(data)
    years = data.map {|d| d.year }.sort
    years_range = (years.first .. years.last).to_a
    x_axis_label = years_range.map {|y| y == years.first || y == years.last ? y : "" }
    data_by_year = data.group_by(&:year)
    articles = years_range.map {|y| data_by_year[y].nil? ? 0 : data_by_year[y][0].articles } 
    article_max = number_with_delimiter(articles.sort.last)
    bar_chart(articles, x_axis_label, article_max).html_safe
  end
  
  def bar_chart(data, x_axis_label, y_axis_max, legend = nil)
    x_axis_label[0] = "" unless x_axis_label.size == 1 || x_axis_label.size > 5
    width = x_axis_label.size * 10 + 50
    width += 70 unless legend.nil?
    colors = case data.size
      when 2: "000066,999999"
      when 3: "660000,999999,000066"
      else "999999"
    end
    Gchart.bar(:data => data, :axis_labels => [x_axis_label, [0, y_axis_max]], :bar_colors => colors, :legend => legend, :size => "#{width}x60", :axis_with_labels => 'x,y', :bar_width_and_spacing => {:width => 7, :spacing => 3}, :format => 'image_tag', :alt => "publication history")
  end

  def period_tab(id = nil, period = 'all')
    periods = [ ["all", "All Time"], ["one", "Last Year"], ["five", "Last 5 Years"], ["ten", "Last 10 Years"] ]
    li = []
    periods.each do |p|
      period_key = p[0]
      period_val = p[1]
      li_class = period == period_key ? controller.controller_name  + " selected" :  controller.controller_name
      link_text = content_tag(:em, period_val).html_safe
      link = case id
        when nil: eval(period_key + "_" + controller.controller_name + "_path")
        else eval(period_key + "_" + controller.controller_name.singularize + "_path")
      end
      li.push(content_tag(:li, link_to(link_text, link).html_safe, :class => li_class))
    end
    content_tag(:ul, li.join("\n").html_safe, :class => "yui-nav <%= controller.controller_name %>")
  end

  def paginated_list(collection, period = "all")
    return content_tag(:span, "No entries found.", :class => "message") if collection.size == 0
    list = []
    list.push(content_tag(:div, pagination_info(collection), :class => "yui-g"))
    half = (collection.size + collection.size % 2) / 2
    li = { "left" => [], "right" => [] }
    for item in collection
      bucket = collection.index(item) < half ? "left" : "right"
      link_title = link_title(item, period)
      articles = case dom_class(item)
        when "article" : ""
        when "author" : "#{pluralize(item.send("#{period}_total"), "article")}"
        when "subject" : "#{pluralize(item.send("#{period}_total"), "article")}"
        else "#{pluralize(item.send(period), "article")}"
      end
      articles_count = dom_class(item).match(/article/) ? ' ' + citation(item, period) : content_tag(:span, number_with_delimiter(articles), :class => "articles_count")
      li[bucket].push(content_tag(:li, link_to(item.to_s, url_for(item) + "/#{period}") + articles_count.html_safe, :title => link_title))
    end
    column = []
    column.push(content_tag(:div, content_tag(:ul, li["left"].join("\n").html_safe), :class => "yui-u first"))
    column.push(content_tag(:div, content_tag(:ul, li["right"].join("\n").html_safe), :class => "yui-u"))
    list.push(content_tag(:div, column.join("\n").html_safe, :class => "yui-g"))
    list.push(content_tag(:div, will_paginate(collection), :class => "yui-g")) 
    list.join("\n").html_safe
  end

  def link_title(item, period)
    title = ""
    if item.respond_to?("#{period}_first")
      title = ["first", "middle", "last"].map {|pos| pluralize(item.send("#{period}_#{pos}"), "#{pos} author article")}.join(", ")
    elsif item.respond_to?("#{period}_major")
      title = ["major", "minor"].map {|type| pluralize(item.send("#{period}_#{type}"), "#{type} topic article")}.join(", ")
    elsif item.respond_to?(period)
      title = pluralize(item.send(period), "article")
    end
    title
  end

  def pagination_info(collection)
    content_tag :div, page_entries_info(collection).html_safe, :class => "pagination_info"
  end

  def alphabetical_query_list(query)
    li = link_to_unless query.blank?, "All"
    list = [content_tag(:li, li)]
    "A".upto("Z") do |l|
      li = link_to_unless l == query, l, :q => l
      list.push(content_tag(:li, li)) 
    end
    content_tag :ul, list.join("\n").html_safe, :class => "alphabetical"
  end
  
  def columns(data)
    if data.size == 2 or data.size == 4
      bucket = {}
      bucket["left"] = data.select {|d| data.index(d) % 2 == 0}
      bucket["right"] = data.select {|d| data.index(d) % 2 == 1}
      column = []
      column.push(content_tag(:div, bucket["left"].join("\n").html_safe, :class => "yui-u first"))
      column.push(content_tag(:div, bucket["right"].join("\n").html_safe, :class => "yui-u"))
      content_tag(:div, column.join("\n").html_safe, :class => "yui-g")    
    elsif data.size == 3 or data.size == 5
      bucket = {}
      bucket["left"] = data.select {|d| data.index(d) % 3 == 0}
      bucket["middle"] = data.select {|d| data.index(d) % 3 == 1}
      bucket["right"] = data.select {|d| data.index(d) % 3 == 2}
      column = []
      column.push(content_tag(:div, bucket["left"].join("\n").html_safe, :class => "yui-u first"))
      column.push(content_tag(:div, bucket["middle"].join("\n").html_safe, :class => "yui-u"))
      column.push(content_tag(:div, bucket["right"].join("\n").html_safe, :class => "yui-u"))
      content_tag(:div, column.join("\n").html_safe, :class => "yui-gb")
    end
  end
  
  def first_page?
    params[:page].nil? || params[:page].to_i == 1
  end
  
  def clouds(list, counter, log = false, classes = nil)
    css_classes ||= %w(cloud1 cloud2 cloud3 cloud4 cloud5 cloud6 cloud7 cloud8 cloud9)
    max, min = 0, 1000000
    list.each do |l|
      raw_count = l.send(:read_attribute, counter)
      count = log ? Math.log(raw_count) : raw_count
      max = count if count > max
      min = count if count < min
    end
    divisor = ((max - min) / css_classes.size) + 1
    li = []
    list.each do |l|
      raw_count = l.send(:read_attribute, counter)
      count = log ? Math.log(raw_count) : raw_count
      css_class = list.size == 1 ? "cloud9" : css_classes[(count - min) / divisor]
      span = content_tag(:span, number_with_delimiter(raw_count))
      li.push(content_tag(:li, link_to(l.to_s, url_for(l) +"/#{@period}", :title => number_with_delimiter(raw_count)) + span, :class => css_class))
    end
    content_tag(:ul, li.join("\n").html_safe, :class => "clouds")
  end
  
  def page_title(title)
    content_for(:title) {title}
  end
end
