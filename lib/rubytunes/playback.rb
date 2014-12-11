require 'rubytunes/base'

class RubyTunes
  class Playback < Base

    # state
    def play; run :play end
    def pause; run :pause end
    def stop; run :stop end
    def rewind; run :rewind end
    def toggle; run :playpause end
    def state; run 'player state' end

    # track control
    def next; run 'next track' end
    def previous; run 'previous track' end

    # position
    def position; run 'player position' end
    def position=(position); run "set player position to #{position}" end

    # volume
    def volume; run 'sound volume' end
    def volume=(volume); run "set sound volume to #{volume}" end

  end
end
