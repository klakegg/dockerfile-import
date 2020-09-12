require 'pathname'

if ARGV.count == 0 or ARGV.count > 2
  puts "Usage: dockerfile-import [source] (target)"
  exit 1
end

# Loading library
Dir["#{__dir__}/lib/*.rb"].each {|file| require file }

# Create new Dockerfiles instances
dockerfiles = Dockerfiles::new

# Fetch Dockerfile
dockerfile = dockerfiles.get Pathname::new ARGV[0]

if ARGV.count == 1
  # Print resulting Dockerfile
  puts dockerfile
else
  # Write resulting Dockerfile to file
  File.open(ARGV[1], 'w') do |file| 
    file.write(dockerfile.to_s) 
  end
end