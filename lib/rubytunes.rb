require 'rubytunes/version'
require 'rubytunes/playback'

class RubyTunes

  def playback
    @playback ||= RubyTunes::Playback.new
  end

end
