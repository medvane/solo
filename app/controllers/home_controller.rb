class HomeController < ApplicationController
  def index(period = "all")
    @bibliome_stat = BibliomeStat.last
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

end
