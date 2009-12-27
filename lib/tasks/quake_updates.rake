require 'net/http'

namespace :quakes_update do

desc "Updates quakes for hour and day periods. Graps the files from http://earthquake.usgs.gov/ and puts them in /tmp"
task :update do
  # Grab file for 1 hour quakes 
  req = Net::HTTP.get(URI.parse('http://earthquake.usgs.gov/earthquakes/catalogs/eqs1hour-M1.txt'))
  File.open("#{RAILS_ROOT}/tmp/eqs1hour-M1.txt",'w') { |f| f.write(req) }

  # Grab file for 1 day quakes 
  req = Net::HTTP.get(URI.parse('http://earthquake.usgs.gov/earthquakes/catalogs/eqs1day-M1.txt'))
  File.open("#{RAILS_ROOT}/tmp/eqs1day-M1.txt",'w') { |f| f.write(req) }

end

end




