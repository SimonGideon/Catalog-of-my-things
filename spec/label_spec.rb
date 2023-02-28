require_relative 'spec_helper'

describe Label do
  describe '#initialize' do
    it 'creates a new Label object with correct instance variables' do
      label = Label.new('Fiction', 'Red')

      expect(label.title).to eq('Fiction')
      expect(label.color).to eq('Red')
      expect(label.id).not_to be_nil
      expect(label.items).to eq([])
    end
  end

  describe '#add_item' do
    it "adds a new item to the label's items array" do
      label = Label.new('Fiction', 'Red')
      book = Book.new({ genre: 'Fiction', author: 'J.K. Rowling', source: 'Library', label: 'Bloomsbury',
                        publish_date: '2022-06-26', publisher: 'Bloomsbury', cover_state: 'good' })

      label.add_item(book)

      expect(label.items).to eq([book])
      expect(book.label).to eq(label)
    end
  end
end
