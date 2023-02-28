require_relative 'spec_helper'

describe Game do
  context '#initialize' do
    it 'Should initialize the class' do
      game_info_template = Struct.new(:genre, :author, :source, :label, :publish_date)
      game_info = game_info_template.new('Horror', 'Enoque Jonas', 'DVD', 'CD Projekt Red', '2014-10-25')
      game = Game.new(game_info, true, '2019-08-09')

      expect(game).to be_instance_of Game
    end
  end
end
