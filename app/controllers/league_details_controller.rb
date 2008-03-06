class LeagueDetailsController < ApplicationController
  
  def page_title
    "League Standings and Detail"
  end
  
  # GET /league_details/1
  # GET /league_details/1.xml
  def show
    @league = League.find(params[:id])
    @report = @league.detail_report_data

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @league }
    end
  end
end