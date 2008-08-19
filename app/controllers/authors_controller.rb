class AuthorsController < ApplicationController
  # GET /authors
  def index(period = "all")
    total_entries = BibliomeStat.last.send("#{period}_authors")
    @authors = Author.search params[:q], :page => params[:page], :order => "#{period}_first desc, #{period}_last desc, #{period}_middle desc", :conditions => "`#{period}_total` > 0", :total_entries => total_entries

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

  # GET /authors/1
  # GET /authors/1.xml
  def show
    @author = Author.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @author }
    end
  end
end
