class SubjectsController < ApplicationController
  # GET /subjects
  def index(period = "all")
    total_entries = Subject.total_entries(period)
    @subjects = Subject.search params[:q], :page => params[:page], :order => SUBJECT_ORDER[period], :conditions => "`#{period}_major` > 0", :total_entries => total_entries
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

  # GET /subjects/1
  def show(period = "all")
    @period = period
    @subject = Subject.find(params[:id])
    total_entries = @subject.send("#{period}_total")
# TODO: refactor per_page to application method
    per_page = total_entries < ARTICLES_IN_MEMBER_PAGE ? total_entries : ARTICLES_IN_MEMBER_PAGE
    @articles = []
    @articles = @subject.articles.paginate :page => params[:page], :per_page => per_page, :total_entries => total_entries if total_entries > 0
    respond_to do |format|
      format.html  { render :action => "show"}
    end
  end
end
