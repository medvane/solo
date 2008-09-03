class SubjectsController < ApplicationController
  # GET /subjects
  def index(period = "all")
    @q = params[:q]
    total_entries = Subject.total_entries(period) if @q.blank?
    order = @q.blank? ? SUBJECT_ORDER[period] : "term"
    @subjects = Subject.search @q, :page => params[:page], :order => order, :conditions => "`#{period}_major` > 0", :total_entries => total_entries

    respond_to do |format|
      format.html { render :action => "index"}
    end
  end

  # GET /subjects/1
  def show(period = "all")
    @subject = Subject.find(params[:id])
    total_entries = @subject.send("#{period}_total")
    per_page = per_page(total_entries)
    @articles = []
    @articles = @subject.articles.paginate :page => params[:page], :per_page => per_page, :total_entries => total_entries if total_entries > 0
    # period all: one_to_all, five_to_all, ten_to_all
    # period one: one_to_all, one_to_five, one_to_ten
    # period five: one_to_five, five_to_ten, five_to_all
    # period ten: one_to_ten, five_to_ten, ten_to_all
    respond_to do |format|
      format.html  { render :action => "show"}
    end
  end
end
