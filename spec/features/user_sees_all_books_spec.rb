require 'rails_helper'

describe 'user index' do
  context 'as a visitor' do
    it 'user can see all books' do
      author_1 = Author.create(name: "Author One")
      book_1 = Book.create(title: "dans amazing book", author: "dan", pages: 4)
      book_2 = Book.create(title: "daves amazing book", author: "dave", pages: 5)
      book_3 = Book.create(title: "johns amazing book", author: "john", pages: 7)

      visit '/books'

      expect(page).to have_content(book_1.title)
      expect(page).to have_content(book_2.title)
      expect(page).to have_content(book_3.title)

      expect(page).to have_content("Length: #{book_3.pages}")
      expect(page).to have_content("Length: #{book_1.pages}")
      expect(page).to have_content("Length: #{book_2.pages}")

      expect(page).to have_content("Author: #{book_3.authors.first}")
      expect(page).to have_content("Author: #{book_2.authors.first}")
      expect(page).to have_content("Author: #{book_1.author}")
    end

    it 'user can see a navigation bar' do
     Book.create(title: "dans amazing book", author: "dan", pages: 4)
     Book.create(title: "daves amazing book", author: "dave", pages: 5)
     Book.create(title: "johns amazing book", author: "john", pages: 7)

     visit '/books'

     click_on 'Home'

     expect(current_path).to eq('/')

     click_on 'Books'
     expect(current_path).to eq('/books')
    end
 end
   it 'user can click title links to show page' do
     book_1 = Book.create(title: "Example One", author: "Author One", pages:10)
     book_2 = Book.create(title:"Example Two", author: "Author Two", pages:20)

     visit books_path

     click_on("#{book_1.title}")

     expect(current_path).to eq(book_path(book_1.id))
     expect(page).to have_content("#{book_1.title}")
     expect(page).to have_content("#{book_1.author}")
     expect(page).to have_content("#{book_1.pages}")

     expect(page).not_to have_content("#{book_2.title}")
     expect(page).not_to have_content("#{book_2.author}")
     expect(page).not_to have_content("#{book_2.pages}")
   end
   it 'user can click author links to show page' do
     author_1 = Author.create(name: "Author One")
     book_1 = Book.create(title: "Example One", author: author_1, pages:10)
     # book_2 = Book.create(title:"Example Two", author: author_1, pages:20)

     visit books_path
     save_and_open_page
     click_on(book_1.authors.name)
     expect(current_path).to eq(author_path(book_1.author))
     # expect(page).to have_content("#{book_1.title}")
     # expect(page).to have_content("#{book_1.author}")
     # expect(page).to have_content("#{book_1.pages}")
     #
     # expect(page).not_to have_content("#{book_2.title}")
     # expect(page).not_to have_content("#{book_2.author}")
     # expect(page).not_to have_content("#{book_2.pages}")
   end



end
