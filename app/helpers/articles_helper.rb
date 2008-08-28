module ArticlesHelper
  def citation(article, period = 'all')
    journal = content_tag :em, article.journal.to_s
    journal_link = link_to(journal, journal_path(article.journal) + '/' + period)
    citation = "#{journal_link} #{article.pubdate.year}" 
    content_tag :span, citation, :class => "citation"
  end
end
