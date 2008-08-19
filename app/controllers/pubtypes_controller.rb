class PubtypesController < ApplicationController
  # GET /pubtypes
  def index(period = "all")
    @pubtypes = Pubtype.search params[:q], :page => params[:page], :order => "`#{period}` desc", :conditions => "`#{period}` > 0"

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

  # GET /pubtypes/1
  # GET /pubtypes/1.xml
  def show
    @pubtype = Pubtype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pubtype }
    end
  end
end
