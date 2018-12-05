require 'rails_helper'

describe 'user index' do
  context 'as a visitor' do
  it 'user can see all books' do
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

    expect(page).to have_content("Author: #{book_3.author}")
    expect(page).to have_content("Author: #{book_2.author}")
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
end
