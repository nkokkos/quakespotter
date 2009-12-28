require 'fastercsv'

module MapHelper
  
 def init_map_eqs1day
    
    points =  []  # define an array to hold the points to be pinned on the map
    
    # Use fastercsv library to read data from the csv file and extract the coordinates of each
    # each point. I use csv file genearated by http://earthquake.usgs.gov
    # For 1 day quakes: http://earthquake.usgs.gov/earthquakes/catalogs/eqs1day-M1.txt
    # For 1 hour quakes: http://earthquake.usgs.gov/earthquakes/catalogs/eqs1hour-M1.txt

    FasterCSV.foreach("#{RAILS_ROOT}/tmp/eqs1day-M1.txt", :headers => true, :col_sep => ',', :row_sep => "\r\n") do |row|
      points << [ row[6], [row[4], row[5] ]  ] # column 4 and 5 are defined as Lat,Lon of the quake point, col6 is the magnitude of the quake
    end
  
    run_map_script do # run_map_script is a method defined inside eschaton google map plugin
      
      map = Google::Map.new(:controls => [:large_map, :map_type], :zoom => 1, :type => :satellite)
    
    #  map = Google::Map.new(:controls => [:large_map, :map_type],
    #                        :center => {:latitude => -33.947, :longitude => 18.462},
    #                        :zoom => 1, :type => :satellite)
    
    #     map.click do |script, location|
    #       map.open_info_window(:location => location, :html => 'hello cape town!')
    #     end

    # @points = [ [38.7847,-122.7702], [34.0206,-117.2071] ]  # test points
    # @points.each { |x| map.add_marker :location => x } # a different way to add marker
      
      points.each do |location|
        
        magnitude = location[0].to_i # grap first item of the subarray, which is the magnitude of the quake, and make it an integer so that we
                                               # can test it using comparisons 
                                               
        if magnitude >= 6
          map.add_marker :location => location[1],   # grap the second item of the subarray, which is the pair of the coordinates
          :icon => :red
        elsif magnitude >= 5 and magnitude  < 6
           map.add_marker :location => location[1],   
          :icon => :yellow
        elsif magnitude  >= 4 and magnitude < 5
           map.add_marker :location => location[1],   
          :icon => :green
        elsif magnitude  <= 3 and magnitude  > 0
          map.add_marker :location => location[1],   
          :icon => :blue
        end #if 
        
      end # points.each do |location|
      
    end #run_map_script

  end   #def init_map_eqs1day


 def init_map_eqs1hour
  
    points =  []  # define an array to hold the points to be pinned on the map
    
    # Use fastercsv library to read data from the csv file and extract the coordinates of each
    # each point. I use csv file genearated by http://earthquake.usgs.gov
    # For 1 day quakes: http://earthquake.usgs.gov/earthquakes/catalogs/eqs1day-M1.txt
    # For 1 hour quakes: http://earthquake.usgs.gov/earthquakes/catalogs/eqs1hour-M1.txt

    FasterCSV.foreach("#{RAILS_ROOT}/tmp/eqs1hour-M1.txt", :headers => true, :col_sep => ',', :row_sep => "\r\n") do |row|
      points << [ row[6], [row[4], row[5] ]  ] # column 4 and 5 are defined as Lat,Lon of the quake point, col6 is the magnitude of the quake
    end
  
    run_map_script do # run_map_script is a method defined inside eschaton google map plugin
      
      map = Google::Map.new(:controls => [:large_map, :map_type], :zoom => 1, :type => :satellite)
    
    #  map = Google::Map.new(:controls => [:large_map, :map_type],
    #                        :center => {:latitude => -33.947, :longitude => 18.462},
    #                        :zoom => 1, :type => :satellite)
    
    #     map.click do |script, location|
    #       map.open_info_window(:location => location, :html => 'hello cape town!')
    #     end

    # @points = [ [38.7847,-122.7702], [34.0206,-117.2071] ]  # test points
    # @points.each { |x| map.add_marker :location => x } # a different way to add marker
      
      points.each do |location|
        
        magnitude = location[0].to_i # grap first item of the subarray, which is the magnitude of the quake, and make it an integer so that we
                                               # can test it using comparisons 
                                          
        if magnitude >= 6
          map.add_marker :location => location[1],   # grap the second item of the subarray, which is the pair of the coordinates
          :icon => :red
        elsif magnitude >= 5 and magnitude  < 6
           map.add_marker :location => location[1],   
          :icon => :yellow
        elsif magnitude  >= 4 and magnitude < 5
           map.add_marker :location => location[1],   
          :icon => :green
        elsif magnitude  <= 3 and magnitude  > 0
          map.add_marker :location => location[1],   
          :icon => :blue
        end #if 
        
      end # points.each do |location|
      
    end #run_map_script

  end   #def init_map_eqs1hour



end # MapHelper module
