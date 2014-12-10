class RubyTunes
  module Utilities
    module DateTime

    private

      def parse_datetime(datetime)
        ::DateTime.strptime(datetime, "date %A, %B %d, %Y at %l:%M:%S %p")
      end

    end
  end
end
