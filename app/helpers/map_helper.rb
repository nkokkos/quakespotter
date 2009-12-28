require 'fastercsv'

module MapHelper
  
 def init_map_eqs1day
    
    @points =  []  # define an array to hold the points to be pinned on the map
    
    # Use fastercsv library to read data from the csv file and extract the coordinates of each
    # each point. I use csv file genearated by http://earthquake.usgs.gov
    # For 1 day quakes: http://earthquake.usgs.gov/earthquakes/catalogs/eqs1day-M1.txt
    # For 1 hour quakes: http://earthquake.usgs.gov/earthquakes/catalogs/eqs1hour-M1.txt

    FasterCSV.foreach("#{RAILS_ROOT}/tmp/eqs1day-M1.txt", :headers => true, :col_sep => ',', :row_sep => "\r\n") do |row|
      @points << [ row[4], row[5] ] # column 4 and 5 are defined as Lat,Lon of the quake point.
    end
  
    run_map_script do # run_map_script is a method defined inside eschaton google map plugin
      map = Google::Map.new(:controls => [:small_map, :map_type],
                        #    :center => {:latitude => -33.947, :longitude => 18.462},
                            :zoom => 2)
    #     map.click do |script, location|
    #       map.open_info_window(:location => location, :html => 'hello cape town!')
    #     end

    # @points = [ [38.7847,-122.7702], [34.0206,-117.2071] ]  # test points
     
    # @points.each { |x| map.add_marker :location => x } # a different way to add marker
      
     @points.each do |location|
        map.add_marker :location =>location
      end

    end #run_map_script

  end   #def init_map_eqs1day


 def init_map_eqs1hour
  
    @points =  []  # define an array to hold the points to be pinned on the map
    
    # Use fastercsv library to read data from the csv file and extract the coordinates of each
    # each point. I use csv file genearated by http://earthquake.usgs.gov
    # For 1 day quakes: http://earthquake.usgs.gov/earthquakes/catalogs/eqs1day-M1.txt
    # For 1 hour quakes: http://earthquake.usgs.gov/earthquakes/catalogs/eqs1hour-M1.txt

    FasterCSV.foreach("#{RAILS_ROOT}/tmp/eqs1hour-M1.txt", :headers => true, :col_sep => ',', :row_sep => "\r\n") do |row|
       @points << [ row[4], row[5] ] # column 4 and 5 are defined as Lat,Lon of the quake point.
    end
  
    run_map_script do # run_map_script is a method defined inside eschaton google map plugin
      map = Google::Map.new(:controls => [:small_map, :map_type],
                        #    :center => {:latitude => -33.947, :longitude => 18.462},
                            :zoom => 2)
    #     map.click do |script, location|
    #       map.open_info_window(:location => location, :html => 'hello cape town!')
    #     end

    # @points = [ [38.7847,-122.7702], [34.0206,-117.2071] ]  # test points
     
    # @points.each { |x| map.add_marker :location => x } # a different way to add marker
      
     @points.each do |location|
        map.add_marker :location => location
      end

    end #run_map_script  

  end   #def init_map_eqs1hour


end # MapHelper module
