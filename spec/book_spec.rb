require_relative 'spec_helper'

describe Book do
  describe '#initialize' do
    it 'creates a new Book object with correct instance variables' do
      book = Book.new({ genre: 'Fiction', author: 'J.K. Rowling', source: 'Library', label: 'Bloomsbury',
                        publish_date: '2022-06-26', publisher: 'Bloomsbury', cover_state: 'good' })

      expect(book.genre).to eq('Fiction')
      expect(book.author).to eq('J.K. Rowling')
      expect(book.source).to eq('Library')
      expect(book.label).to eq('Bloomsbury')
      expect(book.publish_date).to eq(Date.parse('2022-06-26'))
      expect(book.publisher).to eq('Bloomsbury')
      expect(book.cover_state).to eq('good')
    end
  end

  describe '#can_be_archived?' do
    context 'when cover state is good and the item is not 10+ years old' do
      it 'returns false' do
        book = Book.new({ genre: 'Fiction', author: 'J.K. Rowling', source: 'Library',
                          label: 'Harry Potter', publish_date: '2022-06-26', publisher: 'Bloom', cover_state: 'good' })
        expect(book.can_be_archived?).to eq(false)
      end
    end

    context 'when cover state is bad and the item is not 10+ years old' do
      it 'returns true' do
        book = Book.new({ genre: 'Fiction', author: 'J.K. Rowling', source: 'Library',
                          label: 'Harry Potter', publish_date: '2022-06-26', publisher: 'Bloom', cover_state: 'bad' })
        expect(book.can_be_archived?).to eq(true)
      end
    end

    context 'when item is 10+ years old and cover state is good' do
      it 'returns true' do
        book = Book.new({ genre: 'Fiction', author: 'J.K. Rowling', source: 'Borrowed',
                          label: 'Harry Potter', publish_date: '1997-06-26', publisher: 'Bloom', cover_state: 'good' })
        expect(book.can_be_archived?).to eq(true)
      end
    end
  end
end
