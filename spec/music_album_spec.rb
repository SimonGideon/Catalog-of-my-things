require_relative 'spec_helper'

describe Album do
  before(:each) do
    album_info = %w[Horror Simon Source Label 2000-02-20]
    @music_album = Album.new(album_info, true)
  end

  describe '#new' do
    it 'returns an Album object' do
      expect(@music_album).to be_an_instance_of(Album)
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if item can be archived' do
      allow(@music_album).to receive(:archived?).and_return(true)
      expect(@music_album.can_be_archived?).to eq(true)
    end
    it 'returns true if item is on Spotify' do
      expect(@music_album.can_be_archived?).to eq(true)
    end
    it 'returns false if item is not archived and not on Spotify' do
      allow(@music_album).to receive(:archived?).and_return(false)
      @music_album.on_spotify = false
      expect(@music_album.can_be_archived?).to eq(true)
    end
  end
end
