require 'rubytunes/version'
require 'rubytunes/playback'
require 'rubytunes/track'

class RubyTunes

  def playback
    @playback ||= RubyTunes::Playback.new
  end

end
