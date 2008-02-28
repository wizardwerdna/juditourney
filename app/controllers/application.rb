# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  include AuthenticatedSystem
  before_filter :login_required, :only => [:new, :create, :edit, :update, :destroy]
  before_filter :authentication_information
  before_filter :set_crumbs

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '30467657bb1482a3dc8d9f007a14f238'
  protect_from_forgery :only => [:index, :show, :new, :edit, :create, :delete]
  
  
  protected
  
  def crumbs
    [home_crumb]
  end
  
  def set_crumbs
    @crumbs = crumbs
  end
  
  def home_url
    "http://www.badbeatbratz.com"
  end
  
  def home_crumb
    {:name => "Home", :url => home_url}
  end
  
  def entries_crumb
    {:name => "Entries", :url => entries_url}
  end
  
  def layouts_crumb
    {:name => "Layouts", :url => layouts_url}
  end
  
  def league_tournaments_crumb
    {:name => "Tournaments", :url => league_tournaments_url}
  end
  
  def leagues_crumb
    {:name => "Leagues", :url => leagues_url}
  end
  
  def players_crumb
    {:name => "Players", :url => players_url}
  end
  
  def tournaments_crumb
    {:name => "Tournaments", :url => tournaments_url}
  end
  
  def tournament_entries_crumb
    {:name => "Tournament Entries", :url => tournament_entries_url}
  end
  
  def authentication_information
    @current_user = current_user
  end
end
