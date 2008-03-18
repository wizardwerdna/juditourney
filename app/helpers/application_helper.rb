# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def display_flash
    result = ""
    flash.each do |type, message|
      result << result += content_tag("div", message.to_s, :class => "column1-unit", :class=>"flash_#{type}") + "<br \>\n"
    end
    result
  end

  def breadcrumbs_for(*crumbs)
    content_for :breadcrumbs do
      render(:partial => 'shared/breadcrumbs', :object => crumbs)
    end
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
  
  def league_tournaments_crumb(league)
    {:name => "Tournaments", :url => league_tournaments_url(league)}
  end
  
  def league_tournament_crumb(league, tournament)
    {:name => tournament.formatted_start, :url => league_tournament_url(league, tournament)}
  end
  
  def leagues_crumb
    {:name => "Leagues", :url => leagues_url}
  end
  
  def league_crumb (league)
    {:name => league.name, :url => league_url(league) }
  end
  
  def players_crumb
    {:name => "Players", :url => players_url}
  end
  
  def player_crumb(player)
    {:name => player.full_name, :url => player_url(player)}
  end
    
  def session_crumb
    {:name => "Log In", :url => ""}
  end
  
  def tournaments_crumb
    {:name => "Tournaments", :url => tournaments_url}
  end
  
  def tournament_crumb(tournament)
    {:name => "#{tournament.league.name} @ #{tournament.formatted_start}"}
  end
  
  def tournament_entries_crumb(entry)
    {:name => "Tournament Entries", :url => tournament_entries_url(entry)}
  end
  
  def tournament_entry_crumb(tournament, entry)
    {:name => "Entry", :url => tournament_entries_url(@tournament)}
  end 
end