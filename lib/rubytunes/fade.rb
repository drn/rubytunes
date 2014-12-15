require 'rubytunes/playback'

class RubyTunes
  class Fade

    def in
      while (current ||= playback.volume) < 100
        current += 5
        playback.volume = current
      end
    end

    def out
      while (current ||= playback.volume) > 0
        current -= 5
        playback.volume = current
      end
    end

  private

    def playback; @playback ||= RubyTunes::Playback.new end
  end
end
