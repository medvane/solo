class ArticlesController < ApplicationController
  # GET /articles
  def index(period = "all")
    total_entries = BibliomeStat.last.send("#{period}_articles")
    @articles = Article.search params[:q], :page => params[:page], :order => "pubdate desc", :total_entries => total_entries

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

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end
end
