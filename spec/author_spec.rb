require_relative 'spec_helper'

describe Author do
  context '#add_item' do
    it 'Should add a new item to items collection' do
      author = Author.new('Enoque', 'Macanda')
      item = double('item')
      allow(item).to receive(:author=)

      author.add_item item

      expect(author.items).to eql [item]
    end
  end

  context '#initialize' do
    it 'Should initialize the class' do
        author = Author.new('Enoque', 'Macanda')
        
        expect(author).to be_instance_of Author
    end
  end
end
