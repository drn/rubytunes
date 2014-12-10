require 'rubytunes/base'

class RubyTunes
  class Playback < Base

    def play; run :play end
    def pause; run :pause end
    def stop; run :stop end
    def toggle; run :playpause end
    def next; run 'next track' end
    def previous; run 'previous track' end
    def state; run 'player state' end
    def position; run 'player position' end
    def position=(position); run "set player position to #{position}" end

  end
end
