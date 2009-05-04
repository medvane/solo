# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :set_time_period
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  def one
    @period = "one"
    if params[:id].nil?
      index("one")
    else
      show("one")
    end
  end
  
  def five
    @period = "five"
    if params[:id].nil?
      index("five")
    else
      show("five")
    end
  end
  
  def ten
    @period = "ten"
    if params[:id].nil?
      index("ten")
    else
      show("ten")
    end
  end
  
  def all
    @period = "all"
    if params[:id].nil?
      index("all")
    else
      show("all")
    end
  end

  def per_page(total_entries, per_page = ARTICLES_IN_MEMBER_PAGE)
    total_entries < per_page ? total_entries : per_page
  end
  
  private
    def set_time_period
      @period = "all"
    end
end
