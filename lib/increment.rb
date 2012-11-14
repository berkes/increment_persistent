module Increment
  class Runner
    attr_accessor :readonly
    def initialize given_number=nil
      @filename = File.join(ENV["HOME"], ".increment")
      create_new unless File.exists? @filename

      if given_number.nil?
        @number = number_in_file
      else
        @number = given_number
        write given_number
      end
    end

    def increment
      if may_write?
        @number += 1
        write @number
      end
      self
    end

    def number
      @number
    end

    private
    def may_write?
      return FALSE if @readonly

      return TRUE
    end

    def number_in_file
      File.read(@filename).to_i || 0
    end

    def write number
      File.open(@filename, "w+") do |storage|
        storage.write(number)
      end
    end

    def create_new
      write 0 if may_write?
    end
  end
end
