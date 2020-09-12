require 'pathname'

# Loading library
Dir["#{__dir__}/lib/*.rb"].each {|file| require file }

# Create new Dockerfiles instances
dockerfiles = Dockerfiles::new

# Fetch Dockerfile
dockerfile = dockerfiles.get Pathname::new 'test/Dockerfile'

# Print resulting Dockerfile
puts dockerfile