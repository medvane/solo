class JournalsController < ApplicationController
  # GET /journals
  def index(period = "all")
    @q = params[:q]
    order = @q.blank? ? "`#{period}` desc" : "abbr"
    total_entries = BibliomeStat.last_cached.send("#{period}_journals") if @q.blank?
    @journals = Journal.search @q, :page => params[:page], :order => order, :conditions => "`#{period}` > 0", :total_entries => total_entries

    respond_to do |format|
      format.html { render :action => "index"}
    end
  end

  # GET /journals/1
  def show(period = "all")
    @journal = Journal.find(params[:id])
    total_entries = @journal.send(period)
    per_page = per_page(total_entries)
    @articles = [] 
    @articles = @journal.articles.paginate :page => params[:page], :order => "pubdate desc", :per_page => per_page, :total_entries => total_entries if total_entries > 0
    respond_to do |format|
      format.html { render :action => "show"}
    end
  end
end
