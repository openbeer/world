
module BeerDB

class Runner


  include BeerDB::Models

  def initialize
    @logger = Logger.new(STDOUT)
    @logger.level = Logger::INFO

    @opts    = Opts.new
  end

  attr_reader :logger, :opts


  def run( args )
    opt=OptionParser.new do |cmd|
    
      cmd.banner = "Usage: beerdb [options]"

      ## todo: change to different flag??   use -c/--config ???
      cmd.on( '-c', '--create', 'Create DB Schema' ) { opts.create = true }

      cmd.on( '--delete', 'Delete all records' ) { opts.delete = true }
      
      cmd.on( '--load', 'Use Loader for Builtin Beer Data' ) { opts.load = true }
      
      ### todo: in future allow multiple search path??
      cmd.on( '-i', '--include PATH', "Data Path (default is #{opts.data_path})" ) { |path| opts.data_path = path }

      cmd.on( '-v', '--version', "Show version" ) do
        puts BeerDB.banner
        exit
      end

      cmd.on( "--verbose", "Show debug trace" )  do
        logger.datetime_format = "%H:%H:%S"
        logger.level = Logger::DEBUG
        
        ActiveRecord::Base.logger = Logger.new(STDOUT)
      end

      cmd.on_tail( "-h", "--help", "Show this message" ) do
        puts <<EOS

beerdb - beer.db command line tool, version #{VERSION}

#{cmd.help}

Examples:
    beerdb at                             # import austrian beers
    beerdb -c                             # create database schema

More Examples:
    beerdb                                # show stats (table counts, table props)

Further information:
  http://geraldb.github.com/beer.db
  
EOS
        exit
      end
    end

    opt.parse!( args )
  
    puts BeerDB.banner

    puts "working directory: #{Dir.pwd}"
 
    db_config = {
     :adapter  => 'sqlite3',
     :database => "#{opts.output_path}/beer.db"
    }
  
    puts "Connecting to db using settings: "
    pp db_config

    ActiveRecord::Base.establish_connection( db_config )
    
    if opts.create?
      CreateDB.up
    end
    
    if opts.delete?
       # tbd
    end


    args.each do |arg|
      name = arg     # File.basename( arg, '.*' )

      # tbd
    end
    
    dump_stats
    dump_props
    
    puts 'Done.'
    
  end   # method run


  def dump_stats
    # todo: use %5d or similar to format string
    puts "Stats:"
    puts "  #{Beer.count} beers"
    puts "  #{Brewery.count} breweries"
    puts "  #{Country.count} countries"
  end

  def dump_props
    # todo: use %5 or similar to format string
    puts "Props:"
    Prop.order( 'created_at asc' ).all.each do |prop|
      puts "  #{prop.key} / #{prop.value} || #{prop.created_at}"
    end
  end
  
end # class Runner
end # module BeerDB