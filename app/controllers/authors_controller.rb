class AuthorsController < ApplicationController
  # GET /authors
  # GET /authors.xml
  def index
    @authors = Author.search params[:q], :page => params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @authors }
    end
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
