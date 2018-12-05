 require 'rails_helper'

 describe 'show page' do
   describe 'as a visitor' do
     it 'user can see individual books attributes' do
       book_1 = Book.create(title: "Example One", author:"Author One", pages:10)
       book_2 = Book.create(title: "Example Two", author:"Author Two", pages:20)

       visit "/books/#{book_1.id}"

       within('div.book') do
         expect(page).to have_content("Title: #{book_1.title}")
         expect(page).to have_content("Author: #{book_1.author}")
         expect(page).to have_content("Length: #{book_1.pages}")

         expect(page).not_to have_content("#{book_2.title}")
         expect(page).not_to have_content("Author: #{book_2.author}")
         expect(page).not_to have_content("Length: #{book_2.pages}")
       end
     end
   end

   it 'user can see a list of reviews' do
     book_1 = Book.create(title: "Example One", author: "Author One", pages:10)
     book_2 = Book.create(title:"Example Two", author: "Author Two", pages:20)
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
