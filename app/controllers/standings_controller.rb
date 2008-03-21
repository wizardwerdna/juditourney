class StandingsController < ApplicationController
  
  before_filter      :disable_admin_display
  skip_before_filter :authentication_information, :only => :show
  caches_page        :show
  
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
end