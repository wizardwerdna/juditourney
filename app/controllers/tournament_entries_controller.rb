class TournamentEntriesController < EntriesController

    def page_title
      "Tournament Entries for #{@tournament.league.name}"
    end
    
    def index
      @entries = @resource_finder.find(:all)
      @entry = Entry.new
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @entries }
      end
    end

    def create
      @entry = @resource_finder.new(params[:entry])

      respond_to do |format|
        if @entry.save
          flash[:notice] = "Entry for #{@entry.player.full_name} was entered."
          format.html { redirect_to_new_resource }
          format.xml  { render :xml => @entry, :status => :created, :location => @entry }
          format.js {
            record = @resource_finder.find(:first, :conditions => ['result < ?', @entry.result], :order => 'result desc')
            @after_id = (record && dom_id(record)) || 'sentry'
          }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
          format.js { render :template => "tournament_entries/display_errors.js.rjs" }
        end
      end
    end

    def update
      @entry = @resource_finder.find(params[:id])

      respond_to do |format|
        if @entry.update_attributes(params[:entry])
          flash[:notice] = 'Entry was successfully updated.'
          format.html { redirect_to_resource }
          format.xml  { head :ok }
          format.js {
            record = @resource_finder.find(:first, :conditions => ['result < ?', @entry.result], :order => 'result desc')
            @after_id = (record && dom_id(record)) || 'sentry'
          }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
          format.js { render :template => "tournament_entries/display_errors.js.rjs" }
        end
      end
    end


    def edit
      @entry = @resource_finder.find(params[:id])
      respond_to do |format|
        logger.error "in the editor"
        format.html
        format.js
      end
    end
    
    def destroy
      logger.error "in main deleter now"
      @entry = @resource_finder.find(params[:id])
      @entry.destroy

      respond_to do |format|
        format.html { redirect_to_resources }
        format.xml  { head :ok }
        format.js
      end
    end

    protected

    def redirect_to_resource
      redirect_to(tournament_entry_url(@tournament, @entry))
    end

    def redirect_to_resources
      redirect_to(tournament_entries_url(@tournament))
    end

    def redirect_to_new_resource
      redirect_to(new_tournament_entry_url(@tournament))
    end

    def load_resource_finder
      @parent = @tournament = Tournament.find(params[:tournament_id])
      @resource_finder = @parent.entries
    end
    
    def initialize_new_resource
      @entry.tournament = @tournament
      @entry.paid = @tournament.buyin
    end

  end
