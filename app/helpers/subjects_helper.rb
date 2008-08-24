module SubjectsHelper
  def subject_publication_history(data)
    years = data.map {|d| d.year }.sort
    years_range = (years.first .. years.last).to_a
    x_axis_label = years_range.map {|y| y == years.first || y == years.last ? y : "" }
    data_by_year = data.group_by(&:year)
    major = years_range.map {|y| data_by_year[y].nil? ? 0 : data_by_year[y][0].major} 
    minor = years_range.map {|y| data_by_year[y].nil? ? 0 : data_by_year[y][0].minor} 
    articles = [major, minor]
    article_max = number_with_delimiter(data.map {|d| d.total}.sort.last)
    bar_chart(articles, x_axis_label, article_max, ["major topic", "minor topic"])
  end
end
