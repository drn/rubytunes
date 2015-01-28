require 'rubytunes/script'
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

    class << self

      def search(query)
        Script.run(
          'persistent id of tracks whose ' +
          ' name contains "' + query + '"' +
          ' or artist contains "' + query + '"'
        ).split(', ').map { |id| self.new(id: id) }
      end

      def all
        Script.run(
          'persistent id of tracks'
        ).split(', ').map { |id| self.new(id: id) }
      end

    end

    def play; playback.play(self) end

    def to_s; reference end

    def current?; RubyTunes::Track.new.id == self.id end

  private

    def playback; @playback ||= RubyTunes::Playback.new end

  end
end
