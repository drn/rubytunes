require 'rubytunes/item'

class RubyTunes
  class Playlist < Item
    def self.properties
      @@properties ||= super().merge(
        duration: Property.new(name: 'duration', type: :float)
      )
    end
    define_properties

  end
end
