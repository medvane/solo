class PubtypesController < ApplicationController
  # GET /pubtypes
  def index(period = "all")
    @q = params[:q]
    total_entries = Pubtype.total_entries(period) if @q.blank?
    order = @q.blank? ? "`#{period}` desc" : "title"
    @pubtypes = Pubtype.search @q, :page => params[:page], :order => order, :conditions => "`#{period}` > 0", :total_entries => total_entries
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

  # GET /pubtypes/1
  def show(period = "all")
    @period = period
    @pubtype = Pubtype.find(params[:id])
    total_entries = @pubtype.send(period)
    per_page = per_page(total_entries)

    # TODO: add new primary key to articles after sorting by pubdate, so that pubdate is not used in order by
    @articles = []
    @articles = @pubtype.articles.paginate :page => params[:page], :per_page => per_page, :total_entries => total_entries if total_entries > 0
    respond_to do |format|
      format.html  { render :action => "show"}
    end
  end
end
