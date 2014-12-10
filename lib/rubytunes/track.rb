require 'rubytunes/item'
require 'rubytunes/utilities/datetime'

class RubyTunes
  class Track < Item
    include Utilities::DateTime

    def duration; property :duration end
    def artist; property :artist end
    def album; property :album end
    def played_count; property 'played count' end
    def played_at; parse_datetime(property 'played date') end
    def created_at; parse_datetime(property 'date added') end
    def bit_rate; property 'bit rate' end

  end
end
