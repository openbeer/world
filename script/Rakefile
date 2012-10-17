require 'hoe'
require './lib/beerdb/version.rb'

Hoe.spec 'beerdb' do
  
  self.version = BeerDB::VERSION
  
  self.summary = 'beerdb - beer.db command line tool'
  self.description = summary

  self.urls    = ['http://geraldb.github.com/beer.db']
  
  self.author  = 'Gerald Bauer'
  self.email   = 'tobedone@googlegroups.com'
    
  # switch extension to .markdown for gihub formatting
  self.readme_file  = 'README.markdown'
  self.history_file = 'History.markdown'
  
  self.extra_deps = [
    ['activerecord', '~> 3.2']  # NB: will include activesupport,etc.
    ### ['sqlite3',      '~> 1.3']  # NB: install on your own; remove dependency
  ]

end