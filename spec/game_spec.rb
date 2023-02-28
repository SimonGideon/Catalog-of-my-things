require_relative 'spec_helper'

describe Game do
  describe '#initialize' do
    it 'Should initialize the class' do
      game_info_template = Struct.new(:genre, :author, :source, :label, :publish_date)
      game_info = game_info_template.new('Horror', 'Enoque Jonas', 'DVD', 'CD Projekt Red', '2014-10-25')
      game = Game.new(game_info, true, '2019-08-09')

      expect(game).to be_instance_of Game
    end
  end

  describe '#can_be_archived' do
    context 'When last played date is < 2' do
      it 'Should return false' do
        game_info_template = Struct.new(:genre, :author, :source, :label, :publish_date)
        game_info = game_info_template.new('Horror', 'Enoque Jonas', 'DVD', 'CD Projekt Red', '2014-10-25')
        game = Game.new(game_info, true, '2022-08-09')

        cba = game.can_be_archived?

        expect(cba).to eql false
      end
    end

    context 'When last played date is > 2' do
      it 'Should return true' do
        game_info_template = Struct.new(:genre, :author, :source, :label, :publish_date)
        game_info = game_info_template.new('Horror', 'Enoque Jonas', 'DVD', 'CD Projekt Red', '2011-10-25')
        game = Game.new(game_info, true, '2012-08-09')

        cba = game.can_be_archived?

        expect(cba).to eql true
      end
    end
  end
end
