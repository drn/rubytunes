require 'rubytunes/item'
require 'rubytunes/utilities/datetime'

class RubyTunes
  class Track < Item
    include Utilities::DateTime

    def self.properties
      @@properties ||= super().merge(
        duration:     Property.new(name: 'duration',     type: :float),
        artist:       Property.new(name: 'artist',       type: :string),
        album:        Property.new(name: 'album',        type: :string),
        played_count: Property.new(name: 'played count', type: :integer),
        played_at:    Property.new(name: 'played date',  type: :datetime),
        created_at:   Property.new(name: 'date added',   type: :datetime),
        bitrate:      Property.new(name: 'bit rate',     type: :integer)
      )
    end
    define_properties

  end
end
