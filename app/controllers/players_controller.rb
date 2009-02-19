class PlayersController < ApplicationController
  
  # GET /players
  # GET /players.xml
  def index
    @players = Player.find(:all, :order => "last, first")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @players }
    end
  end

  # GET /players/1
  # GET /players/1.xml
  def show
    @player = Player.find(params[:id])
    @page_title = "Meet #{@player.full_name}"
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @player }
    end
  end

  # GET /players/new
  # GET /players/new.xml
  def new
    @player = Player.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @player }
    end
  end

  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
  end

  # POST /players
  # POST /players.xml
  def create
    @player = Player.new(params[:player])

    respond_to do |format|
      if @player.save
        flash[:notice] = 'Player was successfully created.'
        format.html { redirect_to(@player) }
        format.xml  { render :xml => @player, :status => :created, :location => @player }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @player.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /players/1
  # PUT /players/1.xml
  def update
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        flash[:notice] = 'Player was successfully updated.'
        format.html { redirect_to(@player) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @player.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.xml
  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to(players_url) }
      format.xml  { head :ok }
    end
  end
  
  def search
    @result = Player.find_by_full_name(params[:player][:full_name])
    if @result.nil?
      redirect_to players_url
    else
      redirect_to(@result) unless @result.nil?
    end
  end
  
  def auto_complete_for_player_full_name
    @players = Player.find_all_by_full_name_like(params[:player][:full_name], :order => "last, first")
    render :partial => 'player_full_name'
  end

  def auto_complete_for_entry_player_full_name
    puts params[:entry][:player_full_name]
    @players = Player.find_all_by_full_name_like(params[:entry][:player_full_name], :order => "last, first")
    puts "#{@players.size} players caught"
    render :partial => 'player_full_name'
  end
end