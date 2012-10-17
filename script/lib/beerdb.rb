###
# NB: for local testing run like:
#
# 1.9.x: ruby -Ilib lib/beerdb.rb

# core and stlibs

require 'yaml'
require 'pp'
require 'logger'
require 'optparse'
require 'fileutils'
require 'erb'

# rubygems

require 'active_record'   ## todo: add sqlite3? etc.


# our own code

require 'beerdb/models/country'
require 'beerdb/models/beer'
require 'beerdb/models/brewery'
require 'beerdb/models/prop'
require 'beerdb/schema'       # NB: requires beerdb/models (include BeerDB::Models)
require 'beerdb/version'
require 'beerdb/cli/opts'
require 'beerdb/cli/runner'

module BeerDB

  def self.banner
    "beerdb #{VERSION} on Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}]"
  end

  def self.root
    "#{File.expand_path( File.dirname(File.dirname(__FILE__)) )}"
  end

  def self.main
    Runner.new.run(ARGV)
  end
  
end  # module BeerDB


BeerDB.main if __FILE__ == $0