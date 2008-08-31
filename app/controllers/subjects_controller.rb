class SubjectsController < ApplicationController
  # GET /subjects
  def index(period = "all")
    @q = params[:q]
    total_entries = Subject.total_entries(period) if @q.blank?
    order = @q.blank? ? SUBJECT_ORDER[period] : "term"
    @subjects = Subject.search @q, :page => params[:page], :order => order, :conditions => "`#{period}_major` > 0", :total_entries => total_entries
    @period = period

    respond_to do |format|
      format.html { render :action => "index"}
    end
  end

  # GET /subjects/1
  def show(period = "all")
    @period = period
    @subject = Subject.find(params[:id])
    total_entries = @subject.send("#{period}_total")
    per_page = per_page(total_entries)
    @articles = []
    @articles = @subject.articles.paginate :page => params[:page], :per_page => per_page, :total_entries => total_entries if total_entries > 0
    respond_to do |format|
      format.html  { render :action => "show"}
    end
  end
end
