module AuthorsHelper
  def author_publication_history(data)
    years = data.map {|d| d == data.first || d == data.last ? d.year : ""}
    first = data.map {|d| d.first}
    middle = data.map {|d| d.middle}
    last = data.map {|d| d.last}
    articles = [first, middle, last]
    article_max = number_with_delimiter(data.map {|d| d.total}.sort.last)
    bar_chart(articles, years, article_max)
  end
  
  def authorship_position(data, period = 'all')
    first = data.send("#{period}_first")
    middle = data.send("#{period}_middle")
    last = data.send("#{period}_last")
    Gchart.pie(:data => [first, middle, last], :labels => ["first author: #{first}", "middle author: #{middle}", "last author: #{last}"], :size => "250x50", :custom => 'chco=660000,999999,000066', :format => 'image_tag', :alt => "authorship positions")
  end
end
