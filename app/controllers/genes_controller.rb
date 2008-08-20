class GenesController < ApplicationController
  # GET /genes
  def index(period = "all")
    total_entries = BibliomeStat.last.send("#{period}_genes")
    @genes = Gene.search params[:q], :page => params[:page], :order => "`#{period}` desc", :conditions => "`#{period}` > 0", :total_entries => total_entries
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
    per_page = total_entries < 8 ? total_entries : 8
    per_page = 1 if per_page == 0
    @articles = @gene.articles.paginate :page => params[:page], :order => "pubdate desc", :per_page => per_page, :total_entries => total_entries
    respond_to do |format|
      format.html  { render :action => "show"}
    end
  end
end
