require 'rubytunes/playback'

class RubyTunes
  class Fade

    INCREMENT = 5

    def in
      while (current ||= volume) < 100
        self.volume = (current += INCREMENT)
      end
    end

    def out
      while (current ||= volume) > 0
        self.volume = (current -= INCREMENT)
      end
    end

  private

    def volume; playback.volume end

    def volume=(volume); playback.volume = volume end

    def playback; @playback ||= RubyTunes::Playback.new end

  end
end
