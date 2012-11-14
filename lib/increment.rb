module Increment
  INCREMENT_FILE = "increment"

  class Runner
    def initialize number=nil
      @filename = File.join(ENV["HOME"], ".increment")

      if number.nil?
        @number = number_in_file + 1
      else
        @number = number
      end

      write
    end

    def number
      @number
    end

    private
    def number_in_file
      File.exists?(@filename) ? File.read(@filename).to_i : 0
    end

    def write
      File.open(@filename, "w+") do |storage|
        storage.write(@number)
      end
    end
  end

end
