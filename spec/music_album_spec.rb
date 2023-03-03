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
    it 'raises an ArgumentError if not passed two arguments' do
      expect { Album.new }.to raise_error(ArgumentError)
      expect { Album.new('Fiction') }.to raise_error(ArgumentError)
      expect { Album.new('Fiction', true, 'extra') }.to raise_error(ArgumentError)
    end
  
  end
end
