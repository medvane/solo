class PubtypesController < ApplicationController
  # GET /pubtypes
  # GET /pubtypes.xml
  def index
    @pubtypes = Pubtype.search params[:q], :page => params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pubtypes }
    end
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
