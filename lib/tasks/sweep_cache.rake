desc "Delete all cached files"
task :sweep_cache do
  file_pattern = File.join(RAILS_ROOT, "public", "standings*")
  rm_rf(Dir[file_pattern])
  puts "Cache Swept"
end