require_relative 'spec_helper'

describe Album do
  before(:each) do
    album_info_strck = Struct.new(:genre, :author, :source, :label, :publish_date)
    album_info = album_info_strck.new('Fiction', 'Simon', 'casset', 'manjano', '2013-10-15')
    @album = Album.new(album_info, true)
  end

  describe '#new' do
    it 'returns an Album object' do
      expect(@album).to be_an_instance_of(Album)
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if item can be archived' do
      allow(@album).to receive(:archived?).and_return(true)
      expect(@album.can_be_archived?).to eq(true)
    end
    it 'returns true if item is on Spotify' do
      expect(@album.can_be_archived?).to eq(true)
    end
    it 'returns false if item is not archived and not on Spotify' do
      allow(@album).to receive(:archived?).and_return(false)
      @album.on_spotify = false
      expect(@album.can_be_archived?).to eq(false)
    end
  end
end
