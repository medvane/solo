class JournalsController < ApplicationController
  # GET /journals
  def index(period = "all")
    @q = params[:q]
    order = @q.blank? ? "`#{period}` desc" : "abbr"
    total_entries = BibliomeStat.last_cached.send("#{period}_journals") if @q.blank?
    @journals = Journal.search @q, :page => params[:page], :order => order, :conditions => "`#{period}` > 0", :total_entries => total_entries
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

  # GET /journals/1
  def show(period = "all")
    @period = period
    @journal = Journal.find(params[:id])
    total_entries = @journal.send(period)
    per_page = total_entries < ARTICLES_IN_MEMBER_PAGE ? total_entries : ARTICLES_IN_MEMBER_PAGE
    @articles = [] 
    @articles = @journal.articles.paginate :page => params[:page], :order => "pubdate desc", :per_page => per_page, :total_entries => total_entries if total_entries > 0
    respond_to do |format|
      format.html { render :action => "show"}
    end
  end
end
