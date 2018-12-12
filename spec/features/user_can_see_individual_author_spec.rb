require 'rails_helper'

  describe 'Author Show Page' do
    context 'as a visitor' do
      it 'can see all information for author' do

        author_1 = Author.create(name: "Example Author One")
        author_2 = Author.create(name: "Example Author Two")
        book_1 = Book.create(title: "Book Title One", pages: 300, year: 1908, image_url: "PlaceHolderString", authors: [author_1, author_2])
        user_1 = User.create(name: "John Doe")
        user_2 = User.create(name: "Jane Doe")
        review_1 = Review.create(title: "Great Book", description: "I liked this!", score: 5, user: user_1, book: book_1)
        review_2 = Review.create(title: "Terrible Book", description: "I did not like this!", score: 1, user: user_2, book: book_1)

        visit author_path(author_1.id)
    
        expect(page).to have_content(book_1.title)
        expect(page).to have_content(book_1.pages)
        expect(page).to have_content(book_1.year)
        expect(page).to have_content(review_1.title)
        expect(page).to have_content(review_1.score)
        expect(page).to have_content(review_1.user.name)
      end
    end
  end
