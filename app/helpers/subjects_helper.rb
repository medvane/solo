module SubjectsHelper
  def subject_publication_history(data)
    years = data.map {|d| d == data.first || d == data.last ? d.year : ""}
    major = data.map {|d| d.major}
    minor = data.map {|d| d.minor}
    articles = [major, minor]
    article_max = number_with_delimiter(data.map {|d| d.total}.sort.last)
    bar_chart(articles, years, article_max, ["major topic", "minor topic"])
  end
end
