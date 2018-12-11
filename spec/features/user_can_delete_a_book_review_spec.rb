require 'rails_helper'

describe 'On users show page' do
  context 'as a user' do
    it 'can delete a review' do

      author_1 = Author.create(name: "Example Author One")
      author_2 = Author.create(name: "Example Author Two")
      book_1 = Book.create(title: "Book Title One", pages: 300, year: 1908, image_url: "PlaceHolderString", authors: [author_1, author_2])
      book_2 = Book.create(title: "Book Title 3", pages: 400, year: 2908, image_url: "PlaceHolderString", authors: [author_1, author_2])
      book_3 = Book.create(title: "Book Title 4", pages: 10, year: 194, image_url: "PlaceHolderString", authors: [author_1, author_2])
      book_4 = Book.create(title: "Book Title 5", pages: 200, year: 1108, image_url: "PlaceHolderString", authors: [author_1, author_2])
      book_5 = Book.create(title: "Book Title 6", pages: 500, year: 1450, image_url: "PlaceHolderString", authors: [author_1, author_2])
      user_1 = User.create(name: "John Doe")
      user_2 = User.create(name: "Jane Doe")
      review_1 = Review.create(title: "This was a good one", description: "I liked this!", score: 5, user: user_1, book: book_1)
      review_2 = Review.create(title: "Terrible Book", description: "I did not like this!", score: 1, user: user_2, book: book_1)

      visit user_path(user_1.id)

      expect(page).to have_content(review_1.title)
      expect(page).not_to have_content(review_2.title)
      expect(page).to have_button("Delete")


      click_button("Delete")


      expect(current_path).to eq(user_path(user_1.id))
      expect(page).not_to have_content(review_1.title)
    end
  end
end
