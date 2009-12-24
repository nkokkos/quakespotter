class QuakesPastDayController < ApplicationController
  
  def index
  end

   def show
    @a= []
    
    FasterCSV.each("#{RAILS_ROOT}/tmp/eqs1hour-M1.txt", :headers => true, :col_sep => ',') do |row|
      @a << [ row[5], row[6] ]
    end
    
    end
      
end
