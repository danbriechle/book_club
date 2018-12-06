 require 'rails_helper'

 describe 'show page' do
   describe 'as a visitor' do
     it 'user can see individual books attributes' do
       book_1 = Book.create(title: "dans amazing book", pages: 4, year: 2012, image_url: "place")
       book_2 = Book.create(title: "daves amazing book", pages: 5, year:2016, image_url: "otherplace")
       author_1 = book_1.authors.create(name: "Author One")
       author_2 = book_2.authors.create(name: "Author Two")

       visit "/books/#{book_1.id}"

       within('div.book') do
         expect(page).to have_content("Title: #{book_1.title}")
         expect(page).to have_content("Author: #{author_1.name}")
         expect(page).to have_content("Length: #{book_1.pages}")

         expect(page).not_to have_content("#{book_2.title}")
         expect(page).not_to have_content("Author: #{author_2.name}")
         expect(page).not_to have_content("Length: #{book_2.pages}")
       end
     end
   end

    it 'user can see a list of reviews' do
      book_1 = Book.create(title: "dans amazing book", pages: 4, year: 2012, image_url: "place")
      book_2 = Book.create(title: "daves amazing book", pages: 5, year:2016, image_url: "otherplace")
      book_3 = Book.create(title: "johns amazing book", pages: 7, year: 2020, image_url: "sameplace")
      book_1.authors.create(name: "Author One")
      book_2.authors.create(name: "Author Two")
      book_3.authors.create(name: "Author Three")
      review_1 = Review.create(title: "Good Review", description: "This book is great!", score:5, book: book_1 )
      review_2 = Review.create(title: "Bad Review", description: "This book is horrible!", score:1, book: book_2)

     visit "books/#{book_1.id}"

     within('div.review') do
       expect(page).to have_content(review_1.title)
       expect(page).to have_content(review_1.description)


       expect(page).not_to have_content(review_2.title)
       expect(page).not_to have_content(review_2.description)

     end

    end

  end
