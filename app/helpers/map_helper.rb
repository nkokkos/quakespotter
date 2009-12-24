require 'fastercsv'

module MapHelper
  
  def init_map
    @a=  []
    @b = []
    
    
    FasterCSV.foreach("#{RAILS_ROOT}/tmp/eqs1hour-M1.txt", :headers => true, :col_sep => ',') do |row|
      @b << [ row[4], row[5] ]
      @a << @b
    end
  
    run_map_script do
      map = Google::Map.new(:controls => [:small_map, :map_type],
                        #    :center => {:latitude => -33.947, :longitude => 18.462},
                            :zoom => 2)

 #     map.click do |script, location|
 #       map.open_info_window(:location => location, :html => 'hello cape town!')
 #     end
 
 #    @a.each { |x| map.add_marker :location => x }
     
 #    hops = [ [38.7847,-122.7702], [34.0206,-117.2071] ]
     
      @a.each do |location|
       map.add_marker :location =>location
     end

    end
  
  end
  
end
