require 'rails_helper'

 describe 'On a books show page' do
   context 'As a visitor' do
     it 'sees a link to delete a book' do

       author_1 = Author.create(name: "Example Author One")
       author_2 = Author.create(name: "Example Author Two")
       book_1 = Book.create(title: "Book Title One", pages: 300, year: 1908, image_url: "PlaceHolderString", authors: [author_1, author_2])
       user_1 = User.create(name: "John Doe")
       user_2 = User.create(name: "Jane Doe")
       review_1 = Review.create(title: "Great Book", description: "I liked this!", score: 5, user: user_1, book: book_1)
       review_2 = Review.create(title: "Terrible Book", description: "I did not like this!", score: 1, user: user_2, book: book_1)

       visit book_path(book_1.id)

       expect(page).to have_content(book_1.title)
       expect(page).to have_button("Delete")

       click_button("Delete")

       expect(current_path).to eq(books_path)
       expect(page).not_to have_content(book_1.title)
     end
   end
 end
