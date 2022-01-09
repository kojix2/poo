require "option_parser"

nchr  = 1
nbase = 5000
nl    = 80

OptionParser.parse do |parser|
  parser.banner = "Usage: poo_generate [argument]"
  parser.on("-c NUM", "--chr NUM", "Number of chromosomes") { |n|
    nchr = n.to_i
  }
  parser.on("-b NUM", "--base NUM", "Number of bases per chromosome") { |n|
    nbase = n.to_i
  }
  parser.on("-l NUM", "--line NUM", "Number of characters per line") { |n|
    nl = n.to_i
  }
  parser.on("-h NUM", "--help", "Show this help") do
    puts parser
    exit
  end
  parser.invalid_option do |flag|
    STDERR.puts "ERROR: #{flag} is not a valid option."
    STDERR.puts parser
    exit(1)
  end
end

nchr.times do |n|
  genome = Array(Char).new(nbase) do
    ['A', 'C', 'T', 'G'].sample
  end
  puts ">poo chr#{n + 1}"
  genome.each_slice(nl) do |l|
    puts l.join
  end
end
