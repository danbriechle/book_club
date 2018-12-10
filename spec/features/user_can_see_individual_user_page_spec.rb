# require 'rails_helper'
#
#  describe 'User show page' do
#    context 'as a visitor' do
#      it 'can see an individual users reviews' do
#
#         book_1 = Book.create(title: "dans amazing book", pages: 4, year: 2012, image_url: "place")
#         book_2 = Book.create(title: "daves amazing book", pages: 5, year:2016, image_url: "otherplace")
#
#
#         book_1.authors.create(name: "Author One")
#         book_2.authors.create(name: "Author Two")
#
#
#         user_1 = User.create(name: "John")
#         user_2 = User.create(name: "Joe")
#
#         review_1 = user_1.reviews.create(title: "Good Review", description: "This book is great!", score:5, book: book_1)
#         review_2 = user_2.reviews.create(title: "Bad Review", description: "This book is horrible!", score:2, book: book_2)
#         review_3 = user_2.reviews.create(title: "OK Review", description: "This book is ok", score:3, book: book_2)
#
#         visit user_path(user_1.id)
#
#         expect(page).to have_content(review_1.title)
#         expect(page).to have_content(review_1.score)
#         expect(page).to have_content(review_1.description)
#
#         expect(page).not_to have_content(review_2.title)
#         expect(page).not_to have_content(review_2.score)
#         expect(page).not_to have_content(review_2.description)
#
#       end
#
#       it 'can sort reviews in ascending chronological order' do
#         book_1 = Book.create(title: "dans amazing book", pages: 4, year: 2012, image_url: "place")
#         book_2 = Book.create(title: "daves amazing book", pages: 5, year:2016, image_url: "otherplace")
#
#
#         book_1.authors.create(name: "Author One")
#         book_2.authors.create(name: "Author Two")
#
#
#         user_1 = User.create(name: "John")
#         user_2 = User.create(name: "Joe")
#
#         review_1 = user_1.reviews.create(title: "Good Review", description: "This book is great!", score:5, book: book_1)
#         review_2 = user_2.reviews.create(title: "Bad Review", description: "This book is horrible!", score:2, book: book_2)
#         review_3 = user_2.reviews.create(title: "OK Review", description: "This book is ok", score:3, book: book_2)
#
#         visit user_path(user_1.id)
#
#         expect(page).to have_link('Newest Reviews', :href => "/users/#{user_1.id}")
#       end
#
#       it 'can sort reviews in descending chronological order' do
#         book_1 = Book.create(title: "dans amazing book", pages: 4, year: 2012, image_url: "place")
#         book_2 = Book.create(title: "daves amazing book", pages: 5, year:2016, image_url: "otherplace")
#
#
#         book_1.authors.create(name: "Author One")
#         book_2.authors.create(name: "Author Two")
#
#
#         user_1 = User.create(name: "John")
#         user_2 = User.create(name: "Joe")
#
#         review_1 = user_1.reviews.create(title: "Good Review", description: "This book is great!", score:5, book: book_1)
#         review_2 = user_2.reviews.create(title: "Bad Review", description: "This book is horrible!", score:2, book: book_2)
#         review_3 = user_2.reviews.create(title: "OK Review", description: "This book is ok", score:3, book: book_2)
#
#         visit user_path(user_1.id)
#
#         expect(page).to have_link('Oldest Reviews', :href => "/users/#{user_1.id}")
#       end
#     end
#
#   end
