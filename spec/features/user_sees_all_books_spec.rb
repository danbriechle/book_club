require 'rails_helper'

describe 'user index' do
  it 'user can see all books' do
    book_1 = Book.create(title: "dans amazing book", author: "dan", pages: 4)
    book_2 = Book.create(title: "daves amazing book", author: "dave", pages: 5)
    book_3 = Book.create(title: "johns amazing book", author: "john", pages: 7)

    visit '/books'

    expect(page).to have_content(book_1.title)
    expect(page).to have_content(book_2.title)
    expect(page).to have_content(book_3.title)

    expect(page).to have_content("Length: #{book_3.pages}")
  end
end
