require 'pathname'

if ARGV.count == 0 or ARGV.count > 2
  puts "Usage: dockerfile-import [source] (target)"
  exit 1
end

# Loading library
Dir["#{__dir__}/lib/*.rb"].each { |file| require file }

# Create new loader
loader = DockerfileImport::Loader::new

begin
  # Fetch Dockerfile
  file = loader.get Pathname::new ARGV[0]

  if ARGV.count == 1
    # Print resulting Dockerfile
    puts file
  else
    # Write resulting Dockerfile to file
    File.open(ARGV[1], 'w') do |f|
      f.write(file.to_s)
    end
  end  
rescue => exception
  puts exception.message
  exit 2  
end
