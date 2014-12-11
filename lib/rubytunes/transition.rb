require 'rubytunes/fade'
require 'rubytunes/track'

class RubyTunes
  class Transition

    # @param track [RubyTunes::Track]
    def to(track)
      return if track.current?
      fade.out
      track.play
      sleep 0.5
      fade.in
    end

  private

    def fade
      @fade ||= RubyTunes::Fade.new
    end

  end
end
