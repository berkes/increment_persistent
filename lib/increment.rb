require "yaml/store"

module Increment
  class Runner
    attr_accessor :readonly

    def initialize given_number=nil, name=nil
      @name = name || "undefined"

      @filename = File.join(ENV["HOME"], ".increment")
      @store = YAML::Store.new @filename
      create_new unless File.exists? @filename

      if given_number.nil?
        @number = number_in_file || 0
      else
        @number = given_number
        write given_number
      end
    end

    def increment
      unless @readonly
        @number += 1
        write @number
      end
      self
    end

    def number
      @number
    end

    def list
      list = []
      @store.transaction(false) do
        @store.roots.each do |root|
          list << "#{root}:#{@store[root]}"
        end
      end
      list
    end

    private
    def number_in_file
      number = 0
      @store.transaction(false) do
        number = @store[@name]
      end
      number
    end

    def write number
      @store.transaction do
        @store[@name] = number || 1
      end
    end

    def create_new
      write 0
    end
  end
end
