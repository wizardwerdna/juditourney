class LeagueDetailsController < ApplicationController
  
  skip_before_filter :authentication_information, :only => :show
  around_filter :run_as_unauthenticated
  caches_page :show
  
  def page_title
    "League Standings and Detail"
  end
  
  def show
    @league = League.find(params[:id])
    @report = @league.detail_report_data

    respond_to do |format|
      format.html { render :template => "leagues/show" }
      format.xml  { render :xml => @league }
    end
  end
  
  def run_as_unauthenticated
    olduser = current_user
    self.current_user= :false
    yield
    self.current_user = olduser
  end
end