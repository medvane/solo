class HomeController < ApplicationController
  caches_page :index, :one, :five, :ten, :all

  def index(period = "all")
    @bibliome_stat = BibliomeStat.last_cached

    respond_to do |format|
      format.html { render :action => "index"}
    end
  end
end
