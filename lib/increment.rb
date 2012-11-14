module Increment
  INCREMENT_FILE = "increment"

  class Incrementor
    def run
      File.new(File.join(ENV["HOME"], ".increment"), "w+")
    end
    def number
      1
    end
  end
end
