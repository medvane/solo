class HomeController < ApplicationController
  def index
    @bibliome_stat = BibliomeStat.last
  end
end
