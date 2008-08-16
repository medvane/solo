class GenesController < ApplicationController
  # GET /genes
  # GET /genes.xml
  def index
    @genes = Gene.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @genes }
    end
  end

  # GET /genes/1
  # GET /genes/1.xml
  def show
    @gene = Gene.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gene }
    end
  end
end
