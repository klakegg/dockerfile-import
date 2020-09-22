Gem::Specification.new do |s|
  s.name        = 'dockerfile-import'
  s.version     = '1.0.2'
  s.date        = '2020-09-22'
  s.summary     = "Parsing of Dockerfile containing import instructions."
  s.description = "Library for parsing of Dockerfile instruction sets using IMPORT instruction to organize functionality into multiple files."
  s.authors     = ["Erlend Klakegg Bergheim"]
  s.email       = 'erlend@klakegg.net'
  s.files       = Dir["#{__dir__}/lib/**/*.rb"]
  s.homepage    = 'https://github.com/klakegg/dockerfile-import'
  s.license     = 'MIT'
  s.executables << 'dockerfile-import'
end