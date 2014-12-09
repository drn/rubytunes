require 'rubytunes/base'

module RubyTunes
  class Playback < Base

    def play; run :play end
    def pause; run :pause end
    def stop; run :stop end
    def state; run 'player state' end

  end
end
