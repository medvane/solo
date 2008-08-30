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
  
  def subject_flow(subjects, period = 'all', show = 10)
    show_subjects = subjects[0 .. show - 1]
    year_min = show_subjects.map {|ss| ss.subject_stats.map {|sss| sss.year}.min}.min
    year_max = show_subjects.map {|ss| ss.subject_stats.map {|sss| sss.year}.max}.max
    years = (year_min .. year_max).to_a
    legend = []
    data = []
    cumm = Array.new(years.size, 0)
    data.push(Array.new(years.size, 0))
    subjects[0 .. show - 1].each do |subject|
      stats = subject.subject_stats.sort {|a, b| a.year <=> b.year}.group_by(&:year)
      legend.push(u(subject.term.length > 35 ? subject.term[0 .. 34] + " ..." : subject.term))
      dat = years.map {|y| stats[y].nil? ? cumm[years.index(y)] : cumm[years.index(y)] + stats[y][0].major.to_f / stats[y][0].total_articles.to_f}
      dat.each {|d| cumm[dat.index(d)] = d}
      data.push(dat)
    end
    width = 800
    year_gap = years.size < 20 ? 2 : 5;
    labels = years.map {|y| y % year_gap == 0 ? y : ""}
    colors = %w(444444 770022 cc3322 dd9922 115544 113366 550055 4477ee 999999 222222)
    i = -1
    custom = "&chm=" + colors.map {|c| i += 1; "b,#{c},#{i},#{i + 1},0"}.join("|")
    img = Gchart.line(:data => data.reverse, :legend => legend.reverse, :size => "#{width}x220",:line_colors => colors, :axis_labels => [labels], :axis_with_labels => 'x', :title => "Historic flow of subjects in this time period")
    image_tag img + custom, :alt => "subject flow", :width => 800, :height => 200
  end
end
