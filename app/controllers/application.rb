# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  include AuthenticatedSystem
  before_filter :enable_admin_display
  before_filter :login_required, :only => [:new, :create, :edit, :update, :destroy]
  before_filter :authentication_information
  before_filter :set_page_title

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '30467657bb1482a3dc8d9f007a14f238'
  protect_from_forgery :only => [:index, :show, :new, :edit, :create, :delete]
  
  protected

  def access_denied
    respond_to do |format|
      format.html do
        store_location
        flash[:notice] = "You must authenticate to proceed"
        redirect_to new_session_path
      end
      format.any do
        request_http_basic_authentication 'Web Password'
      end
    end
  end

  def set_page_title
    @page_title = page_title
  end

  def page_title
    "#{controller_name.capitalize}"
  end

  def authentication_information
    @current_user = current_user
  end

  def dom_id_of_tile_to_insert_after_for(resource_finder, entry)
    record = resource_finder.find(:first, :conditions => ['result < ?', entry.result], :order => 'result desc')
    @after_id = (record && dom_id(record)) || 'sentry'
  end
  
  def enable_admin_display
    @admin_display_enabled = true
  end
  
  def disable_admin_display
    @admin_display_enabled = false
  end
  
end
