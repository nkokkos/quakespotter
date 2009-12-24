require 'fastercsv'

class QuakesPastDayController < ApplicationController
  
  def index
  end

   def show
    @a=  []
    @b = []
    
    
    FasterCSV.foreach("#{RAILS_ROOT}/tmp/eqs1hour-M1.txt", :headers => true, :col_sep => ',') do |row|
      @b << [ row[4], row[5] ]
      @a << @b
    end

   end
          
end
