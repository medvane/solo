class PubtypesController < ApplicationController
  # GET /pubtypes
  def index(period = "all")
    @pubtypes = Pubtype.search params[:q], :page => params[:page], :order => "`#{period}` desc", :conditions => "`#{period}` > 0"
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

  # GET /pubtypes/1
  def show(period = "all")
    @period = period
    @pubtype = Pubtype.find(params[:id])

    respond_to do |format|
      format.html  { render :action => "show"}
    end
  end
end
