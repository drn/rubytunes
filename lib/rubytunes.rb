require 'rubytunes/version'
require 'rubytunes/playback'
require 'rubytunes/track'
require 'rubytunes/playlist'

class RubyTunes

  def playback
    @playback ||= RubyTunes::Playback.new
  end

  def track; RubyTunes::Track.new end
  def tracks; RubyTunes::Track.all end

  def playlist; RubyTunes::Playlist.new end
  def playlists; RubyTunes::Playlist.all end

end
