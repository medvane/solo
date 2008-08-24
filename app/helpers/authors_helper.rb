module AuthorsHelper
  def publication_history(data, period = 'all')
    years = data.map {|d| d == data.first || d == data.last ? d.year : ""}
    first = data.map {|d| d.first}
    middle = data.map {|d| d.middle}
    last = data.map {|d| d.last}
    total_max = data.map {|d| d.total}.sort.last
    width = data.size * 10 + 30
    Gchart.bar(:data => [first, middle, last], :axis_with_labels => 'x,y', :axis_labels => [years, [0, total_max]], :bar_colors => ["660000", "999999", "000066"], :size => "#{width}x50", :bar_width_and_spacing => {:width => 6, :spacing => 4}, :format => 'image_tag', :alt => "publication history")
  end
  
  def authorship_position(data, period = 'all')
    first = data.send("#{period}_first")
    middle = data.send("#{period}_middle")
    last = data.send("#{period}_last")
    Gchart.pie(:data => [first, middle, last], :labels => ["first author: #{first}", "middle author: #{middle}", "last author: #{last}"], :size => "250x50", :custom => 'chco=660000,999999,000066', :format => 'image_tag', :alt => "authorship positions")
  end
end
