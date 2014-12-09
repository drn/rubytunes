require 'spec_helper'

RSpec.describe RubyTunes::Playback do
  let(:playback) { RubyTunes::Playback.new }

  context 'playing' do
    before { playback.play }
    it 'should play' do
      expect(playback.state).to eq 'playing'
    end
    context 'play' do
      it 'should not change state' do
        expect { playback.play }.not_to change { playback.state }
      end
    end
    context 'pause' do
      it 'should pause' do
        expect { playback.pause }.to change { playback.state }.to 'paused'
      end
    end
    context 'stop' do
      it 'should stop' do
        expect { playback.stop }.to change { playback.state }.to 'stopped'
      end
    end
    context 'toggle' do
      it 'should toggle' do
        expect { playback.toggle }.to change { playback.state }.to 'paused'
      end
    end
  end

end
