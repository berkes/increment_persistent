Gem::Specification.new do |s|
  s.name        = 'increment_persistent'
  s.version     = '0.0.2'
  s.summary     = "Increments numbers and remembers them."
  s.description = "Increment numbers persistently. Stores the numbers in a textfile ~/.increment"
  s.authors     = ["Bèr Kessels"]
  s.email       = "ber@webschuur.com"
  s.files       = ["lib/increment.rb"]
  s.homepage    = 'http://github.com/berkes/increment_persistent'

  s.add_runtime_dependency "thor", "~> 0.16.0"

  s.executables << 'increment'
end
