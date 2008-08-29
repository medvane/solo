class AuthorsController < ApplicationController
  # GET /authors
  def index(period = "all")
    @q = params[:q]
    total_entries = BibliomeStat.last_cached.send("#{period}_authors") if @q.blank?
    order = @q.blank? ? AUTHOR_ORDER[period] : "last_name, fore_name"
    @authors = Author.search @q, :page => params[:page], :order => order, :conditions => "#{period}_total > 0", :total_entries => total_entries
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

  # GET /authors/1
  def show(period = "all")
    @period = period
    @author = Author.find(params[:id])
    total_entries = @author.send("#{period}_total")
    per_page = total_entries < ARTICLES_IN_MEMBER_PAGE ? total_entries : ARTICLES_IN_MEMBER_PAGE
    @articles = []
    @articles = @author.articles.paginate :page => params[:page], :per_page => per_page, :order => "authorships.article_id desc", :total_entries => total_entries if total_entries > 0
    respond_to do |format|
      format.html  { render :action => "show"}
    end
  end
end
