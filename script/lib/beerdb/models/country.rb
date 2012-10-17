module BeerDB
  module Models

  
class Country < ActiveRecord::Base
  self.table_name = 'countries'

  def self.create_from_ary!( countries )
    countries.each do |values|
      
      ## key & title required
      attr = {
        :key   => values[0],
        :title => values[1],
        :tag   => values[2]
      }
      
      Country.create!( attr )
    end # each country
  end

end # class Country


 end # module Models
end # module BeerDB
