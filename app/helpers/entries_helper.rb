module EntriesHelper
  def dom_id_of_tile_to_insert_after_for(resource_finder, entry)
    record = resource_finder.find(:first, :conditions => ['result < ?', entry.result], :order => 'result desc')
    @after_id = (record && dom_id(record)) || 'sentry'
  end
end
