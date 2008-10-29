class ArticlesController < ApplicationController
  # GET /articles
  def index(period = "all")
    total_entries = BibliomeStat.last_cached.send("#{period}_articles")
    per_page = per_page(total_entries, 14)
    @articles = Article.search params[:q], :page => params[:page], :per_page => per_page, :total_entries => total_entries

    respond_to do |format|
      format.html { render :action => "index"}
    end
  end

  # GET /articles/1
  def show(period = "all")
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html  { render :action => "show"}
    end
  end
end
