
module BeerDB

class CreateDB

  include BeerDB::Models


def self.up

  ActiveRecord::Schema.define do

create_table :countries do |t|
  t.string :title, :null => false
  t.string :tag,   :null => false  # short three letter tag
  t.string :key,   :null => false
  t.timestamps
end

create_table :props do |t|
  t.string :key,   :null => false
  t.string :value, :null => false
  t.timestamps
end

create_table :beers do |t|
  t.string  :title, :null => false
  t.string  :key,   :null => false   # import/export key
  t.string  :synonyms  # comma separated list of synonyms
  t.boolean  :bottle,  :null => false, :default => false # Flaschenbier
  t.boolean  :draft,   :null => false, :default => false # Fassbier
  ## todo: check seasonal is it proper english?
  t.boolean  :seasonal, :null => false, :default => false # all year or just eg. Festbier/Oktoberfest Special
  ## todo: add microbrew/brewpub flag?
  #### t.boolean  :brewpub, :null => false, :default => false 
  t.timestamps
end
    
create_table :breweries do |t|
  t.string  :title
  t.references :country,   :null => false
  t.timestamps
end
    
  end # block Schema.define


  Prop.create!( key: 'db.schema.version', value: BeerDB::VERSION )

end # method up

end # class CreateDB

end # module BeerDB