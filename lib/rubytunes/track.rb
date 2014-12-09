require 'rubytunes/base'

class RubyTunes
  class Track < Base

    def self.random
      self.new(reference: 'some track')
    end

    # Defaults to the current track
    # @param info [Hash] (optional)
    #   {
    #     id:         String, (optional)
    #     name:       String, (optional)
    #     reference:  String  (optional)
    #   }
    def initialize(info={})
      @info = info
    end

    def name; run :name end

    def id; run 'persistent id' end

  private

    def run(command)
      super("#{command} of #{track}")
    end

    def track
      track_by_id || track_by_name || track_by_reference
    end

    def track_by_id
      @info[:id] && "some track whose persistent id is \"#{@info[:id]}\""
    end

    def track_by_name
      @info[:name] && "some track whose name is \"#{@info[:name]}\""
    end

    def track_by_reference
      @info[:reference] || 'current track'
    end

  end
end
