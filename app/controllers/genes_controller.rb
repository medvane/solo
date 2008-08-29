class GenesController < ApplicationController
  # GET /genes
  def index(period = "all")
    @q = params[:q]
    total_entries = BibliomeStat.last_cached.send("#{period}_genes") if @q.blank?
    order = @q.blank? ? "`#{period}` desc" : "symbol"
    @genes = Gene.search @q, :page => params[:page], :order => order, :conditions => "`#{period}` > 0", :total_entries => total_entries
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

  # GET /genes/1
  def show(period = "all")
    @period = period
    @gene = Gene.find(params[:id])
    total_entries = @gene.send(period)
    per_page = total_entries < ARTICLES_IN_MEMBER_PAGE ? total_entries : ARTICLES_IN_MEMBER_PAGE
    @articles = []
    @articles = @gene.articles.paginate :page => params[:page], :per_page => per_page, :total_entries => total_entries if total_entries > 0
    respond_to do |format|
      format.html  { render :action => "show"}
    end
  end
end
