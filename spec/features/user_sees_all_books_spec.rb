require 'rails_helper'

describe 'user index' do
  context 'as a visitor' do
    it 'user can see all books' do
      book_1 = Book.create(title: "dans amazing book", pages: 4, year: 2012, image_url: "place")
      book_2 = Book.create(title: "daves amazing book", pages: 5, year:2016, image_url: "otherplace")
      book_3 = Book.create(title: "johns amazing book", pages: 7, year: 2020, image_url: "sameplace")
      author_1 = book_1.authors.create(name: "Author One")
      author_2 = book_2.authors.create(name: "Author Two")
      author_3 = book_3.authors.create(name: "Author Three")



      visit '/books'


      expect(page).to have_content(book_1.title)
      expect(page).to have_content(book_2.title)
      expect(page).to have_content(book_3.title)

      expect(page).to have_content("Length: #{book_3.pages}")
      expect(page).to have_content("Length: #{book_1.pages}")
      expect(page).to have_content("Length: #{book_2.pages}")

      expect(page).to have_content("Author: #{author_1.name}")
      expect(page).to have_content("Author: #{author_2.name}")
      expect(page).to have_content("Author: #{author_3.name}")
    end

    it 'user can see a navigation bar' do
     Book.create(title: "dans amazing book", pages: 4, year: 2012, image_url: "place")
     Book.create(title: "daves amazing book", pages: 5, year:2016, image_url: "otherplace")
     Book.create(title: "johns amazing book", pages: 7, year: 2020, image_url: "sameplace")

     visit '/books'

     click_on 'Home'

     expect(current_path).to eq('/')

     click_on 'Books'
     expect(current_path).to eq('/books')
    end
 end
    it 'user can click title links to show page' do
      book_1 = Book.create(title: "dans amazing book", pages: 4, year: 2012, image_url: "place")
      book_2 = Book.create(title: "daves amazing book", pages: 5, year:2016, image_url: "otherplace")
      author_1 = book_1.authors.create(name: "Author One")
      author_2 = book_2.authors.create(name: "Author Two")


     visit books_path

     click_on(book_1.title)


     expect(current_path).to eq(book_path(book_1.id))
     expect(page).to have_content("#{book_1.title}")
     expect(page).to have_content("#{author_1.name}")
     expect(page).to have_content("#{book_1.pages}")

     expect(page).not_to have_content("#{book_2.title}")
     expect(page).not_to have_content("#{author_2.name}")
     expect(page).not_to have_content("#{book_2.pages}")
   end
   it 'user can click author links to show page' do
     book_1 = Book.create(title: "dans amazing book", pages: 4, year: 2012, image_url: "place")
     book_2 = Book.create(title: "daves amazing book", pages: 5, year:2016, image_url: "otherplace")
     author_1 = book_1.authors.create(name: "Author One")
     author_2 = book_2.authors.create(name: "Author Two")

     visit books_path




     click_on("#{author_1.name}")

     expect(current_path).to eq(author_path(author_1.id))
     expect(page).to have_content("#{author_1.name}")
     expect(page).to have_content("#{book_1.title}")
     expect(page).to have_content("#{book_1.pages}")

     expect(page).not_to have_content("#{book_2.title}")
     expect(page).not_to have_content("#{author_2.name}")
     expect(page).not_to have_content("#{book_2.pages}")
   end




end
