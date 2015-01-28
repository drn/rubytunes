class RubyTunes
  class Script
    class << self

      def run(command)
        `osascript -e 'tell app "iTunes"' -e '#{command}' -e 'end tell'`.strip
      end

    end
  end
end
