# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '0ca25962987e514f959725f6f88e03bb'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
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
end
