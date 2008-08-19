class SubjectsController < ApplicationController
  # GET /subjects
  def index(period = "all")
    total_entries = BibliomeStat.last.send("#{period}_subjects")
    @subjects = Subject.search params[:q], :page => params[:page], :order => "#{period}_major desc, #{period}_minor desc", :conditions => "`#{period}_total` > 0", :total_entries => total_entries

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

  # GET /subjects/1
  # GET /subjects/1.xml
  def show
    @subject = Subject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @subject }
    end
  end
end
