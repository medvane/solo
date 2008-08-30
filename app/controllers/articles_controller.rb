class ArticlesController < ApplicationController
  # GET /articles
  def index(period = "all")
    total_entries = BibliomeStat.last_cached.send("#{period}_articles")
    per_page = per_page(total_entries)
    @articles = Article.search params[:q], :page => params[:page], :order => "pubdate desc", :per_page => per_page, :total_entries => total_entries, :include => :journal
    @period = period

    respond_to do |format|
      format.html { render :action => "index"}
    end
  end

  def one
    if params[:id].nil?
      index("one")
    else
      show("one")
    end
  end
  
  def five
    if params[:id].nil?
      index("five")
    else
      show("five")
    end
  end
  
  def ten
    if params[:id].nil?
      index("ten")
    else
      show("ten")
    end
  end
  
  def all
    if params[:id].nil?
      index("all")
    else
      show("all")
    end
  end

  # GET /articles/1
  def show(period = "all")
    @period = period
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html  { render :action => "show"}
    end
  end
end
