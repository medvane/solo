module AuthorsHelper
  def author_publication_history(data)
    years = data.map {|d| d.year }.sort
    years_range = (years.first .. years.last).to_a
    x_axis_label = years_range.map {|y| y == years.first || y == years.last ? y : "" }
    data_by_year = data.group_by(&:year)
    first = years_range.map {|y| data_by_year[y].nil? ? 0 : data_by_year[y][0].first} 
    middle = years_range.map {|y| data_by_year[y].nil? ? 0 : data_by_year[y][0].middle} 
    last = years_range.map {|y| data_by_year[y].nil? ? 0 : data_by_year[y][0].last} 
    articles = [first, middle, last]
    article_max = number_with_delimiter(data.map {|d| d.total}.sort.last)
    bar_chart(articles, x_axis_label, article_max).html_safe
  end
  
  def authorship_position(data, period = 'all')
    return if data.send("#{period}_total") == 0
    first = data.send("#{period}_first")
    middle = data.send("#{period}_middle")
    last = data.send("#{period}_last")
    Gchart.pie(:data => [first, middle, last], :labels => ["first author: #{first}", "middle author: #{middle}", "last author: #{last}"], :size => "250x60", :custom => 'chco=660000,999999,000066', :format => 'image_tag', :alt => "authorship positions").html_safe
  end

  def see_also(author, period = 'all')
    return if author.see_also.size == 0
    li = []
    author.see_also.each do |see|
      li.push(content_tag(:li, link_to(see.to_s, author_path(see) + "/#{period}")))
    end
    ul = content_tag(:ul, li.join("\n").html_safe)
    content_tag :div,("See also:" + ul).html_safe, :id => "see_also"
  end

  def affiliations(author)
    return "" unless author.affiliations.size > 0
    li = []
    author.affiliations.each do |a|
      li.push(content_tag(:li, "[#{a[0]}] #{a[1]}"))
    end
    ul = content_tag(:ul, li.join("\n").html_safe)
    content_tag(:h2, "Affiliations") + ul
  end
end
