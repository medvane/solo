module ArticlesHelper
  def citation(article, period = 'all')
    journal = content_tag(:em, article.journal.to_s)
    citation = link_to(journal + " #{article.pubdate.year}", journal_path(article.journal).html_safe + '/' + period)
    content_tag(:span, citation.html_safe, :class => "citation")
  end
end
