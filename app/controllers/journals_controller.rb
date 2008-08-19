class JournalsController < ApplicationController
  # GET /journals
  def index(period = "all")
    total_entries = BibliomeStat.last.send("#{period}_journals")
    @journals = Journal.search params[:q], :page => params[:page], :order => "`#{period}` desc", :conditions => "`#{period}` > 0", :total_entries => total_entries
    @period = period

    respond_to do |format|
      format.html { render :action => "index"}
    end
  end

  def one
    index("one")
  end
  
  def five
    index("five")
  end
  
  def ten
    index("ten")
  end
  
  def all
    index("all")
  end

  # GET /journals/1
  # GET /journals/1.xml
  def show
    @journal = Journal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @journal }
    end
  end
end
