module Increment
  INCREMENT_FILE = "increment"

  class Incrementor
    def run
      File.new(File.join(ENV["HOME"], ".increment"), "w+")
    end
  end
end
