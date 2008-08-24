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
    bar_chart(articles, x_axis_label, article_max)
  end
  
  def authorship_position(data, period = 'all')
    first = data.send("#{period}_first")
    middle = data.send("#{period}_middle")
    last = data.send("#{period}_last")
    Gchart.pie(:data => [first, middle, last], :labels => ["first author: #{first}", "middle author: #{middle}", "last author: #{last}"], :size => "250x44", :custom => 'chco=660000,999999,000066', :format => 'image_tag', :alt => "authorship positions")
  end
end
