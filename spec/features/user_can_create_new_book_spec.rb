# require 'rails_helper'
#
#  describe 'creating a new book' do
#     context 'as a visitor' do
#       it 'can create a new book from a form' do
#
#
#         author = Author.create(name: "Jean Wilder")
#
#
#         visit new_book_path
#
#
#         fill_in :book_title, with: "A Good Title"
#         fill_in :book_year, with: 1988
#         fill_in :book_pages, with: 305
#         fill_in :book_authors, with: author.name
#         fill_in :book_image_url, with: "String"
#
#
#         click_on 'Create Book'
#
#         new_book = Book.last
#
#         expect(current_path).to eq(books_path)
#         expect(page).to have_content(new_book.title)
#       end
#     end
#   end
