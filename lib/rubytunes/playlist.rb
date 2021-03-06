require 'rubytunes/item'

class RubyTunes
  class Playlist < Item
    def self.properties
      @@properties ||= super().merge(
        duration: Property.new(name: 'duration', type: :float)
      )
    end
    define_properties

    def tracks
      value('persistent id of tracks').split(', ').map do |id|
        RubyTunes::Track.find(id)
      end
    end

    def play(number=nil)
      Script.run "play #{number && "track #{number} of"} #{reference}"
    end
  end
end
