require 'rubytunes/base'

class RubyTunes
  class Track < Base

    def initialize(id=nil)
      @id = id
    end

    def name; run :name end
    def id; run 'persistent id' end

  private

    def run(command)
      super("#{command} of #{track}")
    end

    def track
      @track ||= (
        if @id.nil?
          'current track'
        else
          "some track of library playlist 1 whose persistent id is \"#{@id}\""
        end
      )
    end

  end
end
