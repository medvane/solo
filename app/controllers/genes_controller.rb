class GenesController < ApplicationController
  # GET /genes
  def index(period = "all")
    @q = params[:q]
    total_entries = BibliomeStat.last_cached.send("#{period}_genes") if @q.blank?
    order = @q.blank? ? "genes.#{period} desc" : "symbol"
    @genes = Gene.search @q, :page => params[:page], :order => order, :conditions => "genes.#{period} > 0", :total_entries => total_entries

    respond_to do |format|
      format.html { render :action => "index"}
    end
  end

  # GET /genes/1
  def show(period = "all")
    @gene = Gene.find(params[:id])
    total_entries = @gene.send(period)
    per_page = per_page(total_entries)
    @articles = []
    @articles = @gene.articles.paginate :page => params[:page], :per_page => per_page, :total_entries => total_entries if total_entries > 0
    respond_to do |format|
      format.html  { render :action => "show"}
    end
  end
end
